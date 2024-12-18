import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gallerio/utils/helper/help_screensize.dart';
import 'package:gallerio/utils/helper/pagenavigator.dart';
import 'package:gallerio/utils/theme/colors.dart';
import 'package:gallerio/view/components/apptext.dart';
import 'package:gallerio/view/pages/home/homepage.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Screen.openAsNewPage(context, const HomeScreen());
    },);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
        child: Center(child: AppText(text: "Gallerio",weight: FontWeight.w600,color: ColorResources.WHITE,),),
      ),
    );
  }
}