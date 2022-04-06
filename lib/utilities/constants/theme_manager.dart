import 'package:flutter/material.dart';
import 'package:flutter_mvvm/utilities/constants/color_manager.dart';
import 'package:flutter_mvvm/utilities/constants/font_manager.dart';
import 'package:flutter_mvvm/utilities/constants/sizing_manager.dart';
import 'package:flutter_mvvm/utilities/constants/text_style_manager.dart';

class ThemeManager {
  static ThemeData lightTheme = ThemeData(
    primaryColor: ColorManager.primary,
    primaryColorLight: ColorManager.primaryOpacity70,
    primaryColorDark: ColorManager.darkPrimary,
    accentColor: ColorManager.grey,
    splashColor: ColorManager.primaryOpacity70,
    disabledColor: ColorManager
        .grey1, // will be used incase of disabled button for example
    // card view theme
    cardTheme: CardTheme(
      color: ColorManager.white,
      shadowColor: ColorManager.grey,
      elevation: SizedBoxManager.sb4,
    ),

    // App bar theme
    appBarTheme: AppBarTheme(
      color: ColorManager.primary,
      shadowColor: ColorManager.primaryOpacity70,
      elevation: SizedBoxManager.sb4,
      centerTitle: true,
      titleTextStyle: TextStyleManager.getRegularStyle(
        color: ColorManager.white,
        fontSize: FontSizeManager.s16,
      ),
    ),

    // Button theme
    buttonTheme: ButtonThemeData(
      buttonColor: ColorManager.primary,
      splashColor: ColorManager.primaryOpacity70,
      shape: const StadiumBorder(),
      disabledColor: ColorManager.grey1,
    ),

    // elevated button theme
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        primary: ColorManager.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            SizedBoxManager.sb12,
          ),
        ),
        textStyle: TextStyleManager.getRegularStyle(
          color: ColorManager.white,
          fontSize: FontSizeManager.s16,
        ),
      ),
    ),
    // Text theme
    textTheme: TextTheme(
      headline1: TextStyleManager.getSemiBoldStyle(
        color: ColorManager.darkGrey,
        fontSize: FontSizeManager.s16,
      ),
      subtitle1: TextStyleManager.getMediumStyle(
        color: ColorManager.lightGrey,
        fontSize: FontSizeManager.s14,
      ),
      caption: TextStyleManager.getRegularStyle(
        color: ColorManager.grey1,
      ),
      bodyText1: TextStyleManager.getRegularStyle(
        color: ColorManager.grey,
      ),
    ),

    // input decoration theme (text form field)
    inputDecorationTheme: InputDecorationTheme(
      contentPadding: const EdgeInsets.all(PaddingManager.p8),
      hintStyle: TextStyleManager.getRegularStyle(color: ColorManager.grey1),
      labelStyle: TextStyleManager.getMediumStyle(color: ColorManager.darkGrey),
      errorStyle: TextStyleManager.getRegularStyle(color: ColorManager.error),
      enabledBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.grey, width: SizedBoxManager.sb1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(SizedBoxManager.sb8),
        ),
      ),

      // focused border
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: ColorManager.primary, width: SizedBoxManager.sb1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(SizedBoxManager.sb8),
        ),
      ),

      // error border
      errorBorder: OutlineInputBorder(
        borderSide:
            BorderSide(color: ColorManager.error, width: SizedBoxManager.sb1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(SizedBoxManager.sb8),
        ),
      ),
      // focused error border
      focusedErrorBorder: OutlineInputBorder(
        borderSide: BorderSide(
            color: ColorManager.primary, width: SizedBoxManager.sb1_5),
        borderRadius: const BorderRadius.all(
          Radius.circular(SizedBoxManager.sb8),
        ),
      ),
    ),
  );
}
