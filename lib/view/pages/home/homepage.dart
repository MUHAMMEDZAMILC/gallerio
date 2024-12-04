import 'package:flutter/material.dart';
import 'package:gallerio/utils/helper/help_screensize.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox(
        width: ScreenUtil.screenWidth,
        height: ScreenUtil.screenHeight,
      ),
    );
  }
}