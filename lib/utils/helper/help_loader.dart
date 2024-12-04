
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:gallerio/utils/theme/dimensions.dart';
import 'package:gallerio/view/components/apptext.dart';

import '../theme/colors.dart';
import '../theme/theme_data.dart';
import 'help_screensize.dart';

bool isLoading = false;


const bgColorLoader = Color(0x0c8e8e8e);

 Dialog _alert = Dialog(
    backgroundColor: bgColorLoader,
    insetPadding: const EdgeInsets.all(0),
    child: Center(child: Container(width: 80,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(100),color: ColorResources.WHITE),child: const Center(child: CircularProgressIndicator(color: primarycolor,),),)));

loader({required BuildContext context}) {
  if (isLoading) {
    return;
  }

  isLoading = true;

  try {
    hideKeyboard;
  } catch (_) {
    debugPrint("ERRROR ON SNACKBAR");
  }

  try {
    showDialog(
      barrierDismissible: false,
      context: context,
      useSafeArea: false,
      builder: (BuildContext context) {
        return  AnnotatedRegion<SystemUiOverlayStyle>(
          value: const SystemUiOverlayStyle(statusBarColor: bgColorLoader),
          child: _alert,
        );
      },
    );
  } catch (e) {
    debugPrint("ERRROR ON POPUP:$e");
  }
}

hideLoader(BuildContext context) {
  if (isLoading) {
    isLoading = false;
    Navigator.pop(context);
  }
}

class MyAppLoader extends StatelessWidget {
  const MyAppLoader({super.key});

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return SizedBox(
            width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight!*0.9,
            child: Center(child: Container(width: 80,height: 80,decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: ColorResources.WHITE,boxShadow: [BoxShadow(color: ColorResources.BLACK.withOpacity(0.4),blurStyle: BlurStyle.outer,blurRadius: 5)]),child: const Center(child: CircularProgressIndicator(),),))
          );
  }
}

class PageEntryLoader extends StatelessWidget {
  const PageEntryLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: ScreenUtil.screenWidth,
      height: ScreenUtil.screenHeight,
      color: ColorResources.WHITE,
      child: const Center(
        child: CircularProgressIndicator(color: primarycolor,),
      ),
    );
  }
}
// ignore: must_be_immutable
class PageReloadLoader extends StatelessWidget {
   PageReloadLoader({super.key,required this.onrefresh});
  Function()? onrefresh;
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: Container(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        color: ColorResources.WHITE,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(CupertinoIcons.wifi_slash,size: 20,),
                gapHorizontal,
                AppText(text: 'Network is Down',weight: FontWeight.w600,size: 16,),
              ],
            ),
            gapLarge,
            SizedBox(
              width: ScreenUtil.screenWidth!*0.5,
              child: ElevatedButton(onPressed: onrefresh,style:  ButtonStyle(
                        elevation: const WidgetStatePropertyAll(8),
                          padding:
                              const WidgetStatePropertyAll(EdgeInsets.zero),
                          backgroundColor: const WidgetStatePropertyAll(
                             primarycolor),
                          shadowColor: const WidgetStatePropertyAll(
                              ColorResources.BORDER_SHADE),
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ))), child: AppText(text: 'Refresh',color: ColorResources.WHITE,)),
            )
          ],
        ),
      ),
    );
  }
}
// class PageNotData extends StatelessWidget {
//   const PageNotData({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return  Container(
//       width: ScreenUtil.screenWidth,
//       height: ScreenUtil.screenHeight,
//       color: ColorResources.WHITE,
//       child:  Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             const AppLottie(assetName: 'nodatasmall.json',width: 250,), 
//             AppText(text: "Data Not Found",weight: FontWeight.w500,letterspace: 0.8,color: ColorResources.TEXT2,)
//           ],
//         ),
//       ),
//     );
//   }
// }
void get hideKeyboard => FocusManager.instance.primaryFocus?.unfocus();