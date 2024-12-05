import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:gallerio/model/collection_model.dart';
import 'package:gallerio/model/photos_model.dart';
import 'package:gallerio/utils/helper/help_loader.dart';
import 'package:gallerio/utils/helper/help_screensize.dart';
import 'package:gallerio/utils/theme/colors.dart';
import 'package:gallerio/utils/theme/dimensions.dart';
import 'package:gallerio/utils/theme/theme_data.dart';
import 'package:gallerio/view/components/apptext.dart';
import '../../../controller/bloc/galleriobloc_bloc.dart';
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
      context.read<GallerioBloc>().add(LoadCollectionPhotos(page));
     page++;
    }
  }

  @override
  void initState() {
    scrollcontroller.addListener(scrollfunction);
    context.read<GallerioBloc>().add(LoadHomePageData(page));
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return BlocBuilder<GallerioBloc, GallerioblocState>(
      builder: (context, state) {
        if (state is HomePageLoading) {
          return const PageEntryLoader();
        } else if (state is HomePageLoaded ) {
          return Scaffold(
            appBar: AppBar(
              actions: [
                const CircleAvatar(),
                gapHorizontal,
                Container(
                  height: 40,
                  decoration: BoxDecoration(
                      color: primarycolor,
                      borderRadius: BorderRadius.circular(50)),
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: paddingLarge),
                    child: Center(
                        child: AppText(
                      text: 'Follow',
                      color: ColorResources.WHITE,
                      weight: FontWeight.w500,
                      size: 16,
                    )),
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
                        top: ScreenUtil.screenHeight! * 0.08,
                        child: SizedBox(
                          width: ScreenUtil.screenWidth,
                          height: ScreenUtil.screenHeight! * 0.06,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: state.collections.length,
                            itemBuilder: (context, index) {
                              Collection data =
                                 state.collections[index];
                              return InkWell(
                                splashFactory: NoSplash.splashFactory,
                                onTap: () {
                                  state.selectedCollection = data;
                                  state.photos = [];
                                  page = 0;
                                  context.read<GallerioBloc>().add(SelectCollection(state.selectedCollection?.id));
                                },
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: paddingSmall),
                                  child: Container(
                                    decoration: BoxDecoration(
                                        color: data ==
                                                state.selectedCollection
                                            ? ColorResources.WHITE
                                            : null,
                                        borderRadius:
                                            BorderRadius.circular(50)),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: paddingLarge),
                                      child: Center(
                                          child: AppText(
                                        text: data.title ?? '',
                                        color: data ==
                                                state.selectedCollection
                                            ? ColorResources.BLACK
                                            : ColorResources.WHITE
                                                .withOpacity(0.8),
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
                                child: (state.photos.isEmpty)
                                    ? Center(
                                        child: AppText(text: "Empty Photos"),
                                      )
                                    : ListView(
                                        controller: scrollcontroller,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: padding),
                                            child: Container(
                                              width: ScreenUtil.screenWidth,
                                              height: ScreenUtil.screenHeight! *
                                                  0.25,
                                              decoration: BoxDecoration(
                                                  color: ColorResources.WHITE,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          padding),
                                                  image: DecorationImage(
                                                      image: NetworkImage(
                                                          state
                                                                  .photos
                                                                  .first
                                                                  .urls
                                                                  ?.thumb ??
                                                              ''),
                                                      fit: BoxFit.cover)),
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
                                                state.photos.length,
                                            itemBuilder: (context, index) {
                                              Photos data =
                                                  state.photos[index];
                                              return Visibility(
                                                  visible: state.photos
                                                              .first.id ==
                                                          data.id
                                                      ? false
                                                      : true,
                                                  child: Padding(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              padding),
                                                      child: Column(
                                                        children: [
                                                          ClipRRect(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          padding),
                                                              child: Image
                                                                  .network(data
                                                                          .urls
                                                                          ?.thumb ??
                                                                      '')),
                                                          Row(
                                                            children: [
                                                              Expanded(
                                                                  child:
                                                                      AppText(
                                                                text:
                                                                    data.altDescription ??
                                                                        '',
                                                                weight:
                                                                    FontWeight
                                                                        .w500,
                                                                size: 10,
                                                                maxline: 2,
                                                              )),
                                                              PopupMenuButton(
                                                                  itemBuilder:
                                                                      (context) =>
                                                                          [
                                                                            PopupMenuItem(
                                                                              onTap: () {
                                                                                downloadImage(context, data.urls?.raw ?? '', data.id ?? 'image');
                                                                              },
                                                                              padding: const EdgeInsets.all(paddingSmall),
                                                                              height: 10,
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
                                                                  icon:
                                                                      const Icon(
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
                                                      )));
                                            },
                                          ),
                                          // (state.isbottomloading)
                                          //     ? SizedBox(
                                          //         width:
                                          //             ScreenUtil.screenHeight,
                                          //         height: 100,
                                          //         child: const Center(
                                          //           child:
                                          //               CircularProgressIndicator(
                                          //             color: primarycolor,
                                          //           ),
                                          //         ),
                                          //       )
                                          //     : 0.hBox
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
        }else{
 return PageEntryLoader();
        }
       
      },
    );
  }
}
