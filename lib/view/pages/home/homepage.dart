
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallerio/controller/provider/providercontroller.dart';
import 'package:gallerio/model/collection_model.dart';
import 'package:gallerio/model/photos_model.dart';
import 'package:gallerio/utils/extension/space_ext.dart';
import 'package:gallerio/utils/helper/help_loader.dart';
import 'package:gallerio/utils/helper/help_screensize.dart';
import 'package:gallerio/utils/theme/colors.dart';
import 'package:gallerio/utils/theme/dimensions.dart';
import 'package:gallerio/utils/theme/theme_data.dart';
import 'package:gallerio/view/components/apptext.dart';
import 'package:provider/provider.dart';

import '../../../controller/provider/networkprovider.dart';
import '../../../utils/helper/helper_imgdownload.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final scrollcontroller = ScrollController();
  int page = 0;
  scrollfunction() async {
    if (scrollcontroller.position.pixels ==
        scrollcontroller.position.maxScrollExtent) {
      page = page + 1;
      Provider.of<ProviderController>(context, listen: false)
          .getcollphotos(context, page);
    }
  }

  @override
  void initState() {

    Provider.of<ProviderController>(context, listen: false)
        .gethomepagedata(context, page);
    scrollcontroller.addListener(scrollfunction);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final networkStatus = Provider.of<NetworkStatus>(context, listen: false);
    final service = Provider.of<ProviderController>(context, listen: false);
    final liveservice = Provider.of<ProviderController>(context, listen: true);
    ScreenUtil.init(context);
    return liveservice.ispageloading
        ? const PageEntryLoader()
        : ((networkStatus.connectionStatus.contains(ConnectivityResult.mobile)==false) && (networkStatus.connectionStatus.contains(ConnectivityResult.wifi) ==false))? PageReloadLoader(onrefresh:() async {
    await networkStatus.initConnectivity();
      await  service.gethomepagedata(context, 0);
    },): Scaffold(
            appBar: AppBar(
              actions: [
                const CircleAvatar(),
                gapHorizontal,
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: primarycolor,
                    borderRadius: BorderRadius.circular(50)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal:  paddingLarge),
                    child: Center(child: AppText(text: 'Follow',color: ColorResources.WHITE,weight: FontWeight.w500,size: 16,)),
                  ),
                )
              ],
            ),
            body: SizedBox(
                width: ScreenUtil.screenWidth,
                height: ScreenUtil.screenHeight,
                child: Stack(
                  children: [
                    Positioned(
                      top: ScreenUtil.screenHeight!*0.08,
                        child: SizedBox(
                      width: ScreenUtil.screenWidth,
                      height: ScreenUtil.screenHeight! * 0.06,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemCount: liveservice.collectionlist.length,
                        itemBuilder: (context, index) {
                          Collection data = liveservice.collectionlist[index];
                          return InkWell(
                            splashFactory:
                                                        NoSplash.splashFactory,
                            onTap: () {
                              service.selectedcollection = data;
                              service.photolist = [];
                              page = 0;
                              service.getcollphotos(context, page);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: paddingSmall),
                              child: Container(
                                decoration: BoxDecoration(
                                    color:
                                        data == liveservice.selectedcollection
                                            ? ColorResources.WHITE
                                            : null,
                                    borderRadius: BorderRadius.circular(50)),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric( horizontal: paddingLarge),
                                  child: Center(
                                      child: AppText(
                                    text: data.title ?? '',
                                    color: data ==
                                            liveservice.selectedcollection
                                        ? ColorResources.BLACK
                                        : ColorResources.WHITE.withOpacity(0.8),
                                    weight: FontWeight.w500,
                                  )),
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    )),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        width: ScreenUtil.screenWidth,
                        height: ScreenUtil.screenHeight! * 0.7,
                        decoration: const BoxDecoration(
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(paddingLarge * 2),
                                topRight: Radius.circular(paddingLarge * 2)),
                            color: ColorResources.WHITE),
                        child: Padding(
                          padding: const EdgeInsets.all(padding),
                          child: Column(
                            children: [
                              //  AppText(text: 'All Products',weight: FontWeight.w600,color: ColorResources.BLACK.withOpacity(0.8),),
                              gap,
                              Expanded(
                                child: (liveservice.photolist.isEmpty)
                                    ? Center(
                                        child: AppText(text: "Empty Photos"),
                                      )
                                    : ListView(
                                        controller: scrollcontroller,
                                        children: [
                                          gap,
                                          Container(
                                            width: ScreenUtil.screenWidth,
                                            height: ScreenUtil.screenHeight!*0.2,
                                            decoration: BoxDecoration(
                                              color: ColorResources.WHITE,
                                              image: DecorationImage(image: NetworkImage(liveservice.photolist.first.urls
                                                                      ?.thumb ??
                                                                  ''),fit: BoxFit.cover)
                                            ),
                                          ),
                                          MasonryGridView.builder(
                                            physics:
                                                const NeverScrollableScrollPhysics(),
                                            shrinkWrap: true,
                                            gridDelegate:
                                                const SliverSimpleGridDelegateWithFixedCrossAxisCount(
                                              crossAxisCount: 2,
                                            ),
                                            itemCount:
                                                liveservice.photolist.length,
                                            itemBuilder: (context, index) {
                                              Photos data =
                                                  liveservice.photolist[index];
                                              return Visibility(
                                                visible: liveservice.photolist.first.id == data.id?false:true,
                                                child: Padding(
                                                    padding: const EdgeInsets.all(
                                                        padding),
                                                    child: Column(
                                                      children: [
                                                        ClipRRect(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        padding),
                                                            child: Image.network(
                                                                data.urls
                                                                        ?.thumb ??
                                                                    '')),
                                                        Row(
                                                          children: [
                                                            Expanded(
                                                                child: AppText(
                                                              text:
                                                                  data.altDescription ??
                                                                      '',
                                                              weight:
                                                                  FontWeight.w500,
                                                              size: 10,
                                                              maxline: 2,
                                                            )),
                                                            PopupMenuButton(
                                                                itemBuilder:
                                                                    (context) => [
                                                                          PopupMenuItem(
                                                                            onTap:
                                                                                () {
                                                                              downloadImage(context,data.urls?.raw ?? '',
                                                                                  data.id ?? 'image$index');
                                                                            },
                                                                            padding: const EdgeInsets
                                                                                .all(
                                                                                paddingSmall),
                                                                            height:
                                                                                10,
                                                                            child:
                                                                                Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.spaceAround,
                                                                              children: [
                                                                                const Icon(
                                                                                  Icons.download_rounded,
                                                                                  size: 16,
                                                                                  color: ColorResources.BLACK,
                                                                                ),
                                                                                gapHorizontalSmall,
                                                                                AppText(
                                                                                  text: 'Download',
                                                                                  size: 12,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          )
                                                                        ],
                                                                icon: const Icon(
                                                                  Icons
                                                                      .more_horiz,
                                                                  size: 16,
                                                                  color: ColorResources
                                                                      .ICON_GREY,
                                                                ),
                                                                color:
                                                                    ColorResources
                                                                        .WHITE)
                                                          ],
                                                        )
                                                      ],
                                                    )),
                                              );
                                            },
                                          ),
                                          (liveservice.isbottomloading)
                                              ? SizedBox(
                                                  width:
                                                      ScreenUtil.screenHeight,
                                                  height: 100,
                                                  child: const Center(
                                                    child:
                                                        CircularProgressIndicator(
                                                      color: primarycolor,
                                                    ),
                                                  ),
                                                )
                                              : 0.hBox
                                        ],
                                      ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    )
                  ],
                )),
          );
  }

  
}
