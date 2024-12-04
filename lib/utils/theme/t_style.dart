
import 'package:flutter/material.dart';
import 'package:gallerio/utils/theme/colors.dart';


import 'dimensions.dart';


const EdgeInsets pagePadding =
    EdgeInsets.symmetric(horizontal: paddingLarge, vertical: paddingXL);
const EdgeInsets pagePaddingXL = EdgeInsets.symmetric(horizontal: paddingXL);

extension TextStyleExtensions on TextStyle {
  TextStyle get primary => copyWith(color: ColorResources.PRIMARY);
  TextStyle get border => copyWith(color: ColorResources.BORDER);
  TextStyle get borderShade => copyWith(color: ColorResources.BORDER_SHADE);
  TextStyle get green => copyWith(color: ColorResources.GREEN);
  TextStyle get grey => copyWith(color: ColorResources.GREY);
  TextStyle get grey1 => copyWith(color: ColorResources.GREY1);
  TextStyle get grey2 => copyWith(color: ColorResources.GREY2);
  TextStyle get placeholder => copyWith(color: ColorResources.PLACEHOLDER);
  TextStyle get red => copyWith(color: ColorResources.RED);
  TextStyle get yellow => copyWith(color: ColorResources.YELLOW);
  TextStyle get secondary => copyWith(color: ColorResources.SECONDARY);
  TextStyle get text1 => copyWith(color: ColorResources.TEXT1);
  TextStyle get text2 => copyWith(color: ColorResources.TEXT2);
  TextStyle get blackgrey => copyWith(color: ColorResources.BLACKGREY);

  TextStyle get black => copyWith(color: ColorResources.BLACK);

  TextStyle get white => copyWith(color: ColorResources.WHITE);

  TextStyle get s12 => copyWith(fontSize: 12.0);
  TextStyle get s14 => copyWith(fontSize: 14.0);
  TextStyle get s16 => copyWith(fontSize: 16.0);
  TextStyle get s18 => copyWith(fontSize: 18.0);
  TextStyle get s25 => copyWith(fontSize: 25.0);
  TextStyle get s30 => copyWith(fontSize: 30.0);
  TextStyle get w400 => copyWith(fontWeight: FontWeight.w400);
  TextStyle get w500 => copyWith(fontWeight: FontWeight.w500);
  TextStyle get w600 => copyWith(fontWeight: FontWeight.w600);
  TextStyle get w700 => copyWith(fontWeight: FontWeight.w700);
}
