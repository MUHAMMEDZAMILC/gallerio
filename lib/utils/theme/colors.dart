// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';

import 'dimensions.dart';



class ColorResources {
  static const Color SCAFFOLDBGOLD = Color(0xffF7F8FD);
  static const Color SCAFFOLDBG = Color(0xFF171717);
  static const Color APPBARBG = Color(0xFF161616);
  static const Color PRIMARY = Color(0xff141e3c);
  static const Color GREY1 = Color(0xff777aae);
  static const Color SECONDARY = Color(0xffff1b6f);
  static const Color BLACK = Color(0xff0d0005);
  static const Color GREY2 = Color(0xffbcbedb);
  static const Color GREY3 = Color(0xffd9dae4);
  static const Color GREY4 = Color(0xfff2f2f2);
  static const Color GREY5 = Color(0xfff6f6f6);
  static const Color grey6 = Color(0xffd9d9d9);
  // static const Color GREY7 = Color(0xffd9d9d9);
  static const Color tabBarGrey = Color(0xFFD9D9D9);
  static const Color chatblue = Color(0xffccf1f6);

  static const Color GREEN = Color(0xff1cc02d);
  static const Color RED = Color(0xffff1e1e);
  static const Color YELLOW = Color(0xffefba00);
  static const Color WHITE = Colors.white;
  static const Color BLACKGREY = Color(0xff686868);
  static const Color TRANSPARENT = Colors.transparent;

//to remove

  static const Color BORDER = GREY2;
  //Color(0xFFE7E7E7);
  static const Color PLACEHOLDER = Color.fromARGB(255, 28, 16, 16);
  static const Color TEXT1 = Color(0xFF2F4858);
  static const Color TEXT2 = Color(0xFF334B77);
  static const Color AMTGREEN = Color(0xFF00B512);

  static const Color cardrejectColor = Color(0xffffd2d2);
  static const Color cardRecivedColor = Color(0xffd2f2d5);

  static const Color GREY = Color(0xFF939393);
  // static const Color WHITE = Colors.white;

  static const Color BORDER_SHADE = Color(0xFFF6F6F6);

  static const Color BLUE = Color(0xFF0348CF);
  static const Color CHART_BOOKING = Color(0xFF52ABFD);
  static const Color CHART_REVENUE = Color(0xFF1BC9CD);
  static const Color LAVENDER = Color(0xFF703EC2);

  static const Color CHART_HOLD = Color(0xFFFFBD5A);
  static const Color CHART_CANCEL = Color(0xFFDB0000);
  static const Color ICON_GREY = Color(0xFF9ca4a7);
  static const Color SKYBLUECON = Color(0xFF80b6ca);

  

  static List<BoxShadow> defshadow =  [
                                    BoxShadow(
                                        color: ColorResources.BLACKGREY
                                            .withOpacity(0.3),
                                        blurRadius: paddingSmall)
                                  ];
}
