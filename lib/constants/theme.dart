import 'package:flutter/material.dart';

final ThemeData ownThemeData = ThemeData(
  brightness: Brightness.light,
  primaryColor: OwnColors.colorPalette['primary'],
  appBarTheme: AppBarTheme(color: OwnColors.colorPalette['primary']),
  scaffoldBackgroundColor: OwnColors.colorPalette['white'],
  bottomSheetTheme:
     const BottomSheetThemeData(backgroundColor: Colors.transparent,
      modalBackgroundColor: Colors.transparent
      )
);

class OwnColors {
  static const Map<String, Color> colorPalette = <String, Color>{
    'white': Color(0xFFFFFFFF),
    'black': Color(0xFF000000),
    'disable': Color(0xFFe8e8e8),
    'gray': Color(0xFF8b8b98),
    'lightGray': Color(0xFFF9F9F9),
    'primary': Color(0xFF25C16C),
    'secondary': Color(0xFFF9C60A),
    'other': Color(0xFF173A5A),
    'ignore4': Color(0xFFBC6C25),
    'link': Color(0xFF3784fc)
  };

  static btnBlack(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static btnWhite(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static welcomeBlack(String lang) {
    return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w600,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEn");
  }

  static titleBlack(String? lang) {
    return TextStyle(
        fontSize: 20.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static titleBlackBig(String? lang) {
    return TextStyle(
        fontSize: 25.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static titleWhiteBig(String lang) {
    return TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static titleColor(String? lang) {
    return TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static titlePromotion(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.black,
        decoration: TextDecoration.lineThrough,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static titleColor2(String lang) {
    return TextStyle(
        fontSize: 22.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static buttonCaption(String lang) {
    return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  //---------------------------------//

  static smallBlack(String? lang) {
    return TextStyle(
        fontSize: 10.0,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static smallBlackBold(String? lang) {
    return TextStyle(
        fontSize: 10.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static planNameBlackBold(String? lang) {
    return TextStyle(
        fontSize: 11.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static smallBlackMedium(String lang) {
    return TextStyle(
        fontSize: 10.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static smallWhite(String? lang) {
    return TextStyle(
        fontSize: 10.0,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static smallWhileBold(String? lang) {
    return TextStyle(
        fontSize: 10.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static planNameWhiteBold(String? lang) {
    return TextStyle(
        fontSize: 11.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static small2WhileBold(String lang) {
    return TextStyle(
        fontSize: 12.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static smallColor(String lang) {
    return TextStyle(
        fontSize: 10.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static smallColorBold(String lang) {
    return TextStyle(
        fontSize: 10.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static planNameColorBold(String lang) {
    return TextStyle(
        fontSize: 11.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static smallColor2(String? lang) {
    return TextStyle(
        fontSize: 10.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static smallColor2Bold(String lang) {
    return TextStyle(
        fontSize: 12.0,
        color: colorPalette['secondary'],
        fontWeight: FontWeight.w600,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  //---------------------------------------//
  static normaMenuBold(String lang) {
    return TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalBlack(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalGrey(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['disable'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalGreyBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['disable'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalBlackBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalBlackBoldUnderLine(String? lang) {
    return TextStyle(
        decoration: TextDecoration.underline,
        fontSize: 13.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalBlackMedium(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalBlackBoldMenu(String? lang) {
    return TextStyle(
        fontSize: 11.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static paragraphNormalBlackMedium(String lang) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        height: 2,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static paragraphNormalBlackMediumBold(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        height: 2,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static paragraphSmallBlack(String? lang) {
    return TextStyle(
        fontSize: 15.0,
        color: Colors.black,
        fontWeight: FontWeight.w500,
        height: 2,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static paragraphNormalWhiteMedium(String lang) {
    return TextStyle(
        fontSize: 16.0,
        color: Colors.white,
        fontWeight: FontWeight.w500,
        height: 1.7,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalWhite(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalWhiteBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['white'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalColor(String lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalColorBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['primary'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static suitableColor(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableColorBold(String lang) {
    return TextStyle(
        fontSize: 16.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalColor2(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['secondary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalColor2Bold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['secondary'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static suitableColor2(String lang) {
    return TextStyle(
        fontSize: 15.0,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableColor2Bold(String? lang) {
    return TextStyle(
        fontSize: 15.0,
        color: colorPalette['secondary'],
        fontWeight: FontWeight.w500,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  //*------------------------------------*//

  static bigBlack(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigBlackLight(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigBlackBold(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static bigBlackMedium(String lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigWhite(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigWhiteBold(String lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static hugeWhite(String? lang) {
    return TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableWhiteBold(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static suitableWhite(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.white,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableBlackBold(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static suitableBlack(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: Colors.black,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableGray(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableGrayBold(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static smallGray(String? lang) {
    return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static smallGrayBold(String? lang) {
    return TextStyle(
        fontSize: 12.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalGray(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalGrayBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['gray'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static normalHyperLink(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['link'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static normalHyperLinkBold(String? lang) {
    return TextStyle(
        fontSize: 13.0,
        color: colorPalette['link'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static suitableHyperLink(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: colorPalette['link'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableHyperLinkBold(String? lang) {
    return TextStyle(
        fontSize: 16.0,
        color: colorPalette['link'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static bigColor(String lang) {
    return TextStyle(
        fontSize: 18.0,
        // fontWeight: FontWeight.w600,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigColorBold(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        fontWeight: FontWeight.w600,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static hugeColorBold(String? lang) {
    return TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static hugeColor2Bold(String? lang) {
    return TextStyle(
        fontSize: 24.0,
        fontWeight: FontWeight.w600,
        color: colorPalette['secondary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static bigColor2(String lang) {
    return TextStyle(
        fontSize: 18.0,
        // fontWeight: FontWeight.w600,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static bigColor2Bold(String? lang) {
    return TextStyle(
        fontSize: 18.0,
        // fontWeight: FontWeight.w600,
        color: colorPalette['secondary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static paragraphNormalColor2(String? lang) {
    return TextStyle(
        fontSize: 12.0,
        color: colorPalette['other'],
        height: 1.5,
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableOtherColor(String lang) {
    return TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['other'],
        fontFamily: lang == "ar" ? "fontAr" : "fontEn");
  }

  static suitableOtherColorBold(String? lang) {
    return TextStyle(
        fontSize: 14.0,
        fontWeight: FontWeight.w500,
        color: colorPalette['other'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }

  static splashTitleColor(String? lang) {
    return TextStyle(
        fontSize: 30.0,
        fontWeight: FontWeight.w600,
        color: colorPalette['primary'],
        fontFamily: lang == "ar" ? "fontArBold" : "fontEnBold");
  }
}
