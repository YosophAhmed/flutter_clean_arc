import 'package:clean_arc_project/presentation/resources/color_manger.dart';
import 'package:clean_arc_project/presentation/resources/font_manger.dart';
import 'package:clean_arc_project/presentation/resources/styles_manger.dart';
import 'package:clean_arc_project/presentation/resources/values_manger.dart';
import 'package:flutter/material.dart';

ThemeData getApplicationTheme() => ThemeData(
      // Main Colors
      primaryColor: ColorManger.primary,
      primaryColorLight: ColorManger.lightPrimary,
      primaryColorDark: ColorManger.darkPrimary,
      disabledColor: ColorManger.grey2,
      splashColor: ColorManger.lightPrimary,
      // AppbarTheme
      appBarTheme: AppBarTheme(
        centerTitle: true,
        color: ColorManger.primary,
        elevation: AppSize.size4,
        shadowColor: ColorManger.lightPrimary,
        titleTextStyle: getRegularStyle(
          fontSize: FontSize.size16,
          color: ColorManger.white,
        ),
      ),
      // Button Theme
      buttonTheme: ButtonThemeData(
        shape: const StadiumBorder(),
        disabledColor: ColorManger.grey2,
        buttonColor: ColorManger.primary,
        splashColor: ColorManger.lightPrimary,
      ),
      // Elevated Button Theme
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          textStyle: getRegularStyle(
            fontSize: FontSize.size17,
            color: ColorManger.white,
          ),
          backgroundColor: ColorManger.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(
              AppSize.size12,
            ),
          ),
        ),
      ),
      // CardView Theme
      cardTheme: CardTheme(
        color: ColorManger.white,
        shadowColor: ColorManger.grey1,
        elevation: AppSize.size4,
      ),
      // Text Theme
      textTheme: TextTheme(
        displayLarge: getSemiBoldStyle(
          color: ColorManger.darkGrey,
          fontSize: FontSize.size16,
        ),
        headlineMedium: getRegularStyle(
          color: ColorManger.darkGrey,
          fontSize: FontSize.size14,
        ),
        titleMedium: getMediumStyle(
          color: ColorManger.primary,
          fontSize: FontSize.size16,
        ),
        bodyLarge: getRegularStyle(
          color: ColorManger.grey2,
        ),
        bodySmall: getRegularStyle(
          color: ColorManger.grey1,
        ),
      ),
      // Input Decoration Theme
      inputDecorationTheme: InputDecorationTheme(
        contentPadding: const EdgeInsets.all(
          AppPadding.padding8,
        ),
        hintStyle: getRegularStyle(
          color: ColorManger.grey1,
          fontSize: FontSize.size14,
        ),
        labelStyle: getMediumStyle(
          color: ColorManger.grey1,
          fontSize: FontSize.size14,
        ),
        errorStyle: getRegularStyle(
          color: ColorManger.error,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.primary,
            width: AppSize.size1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.size8,
            ),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.grey1,
            width: AppSize.size1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.size8,
            ),
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.error,
            width: AppSize.size1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.size8,
            ),
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: ColorManger.primary,
            width: AppSize.size1,
          ),
          borderRadius: const BorderRadius.all(
            Radius.circular(
              AppSize.size8,
            ),
          ),
        ),
      ),
    );
