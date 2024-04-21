import 'package:clean_arc_project/presentation/resources/font_manger.dart';
import 'package:flutter/material.dart';

TextStyle _getTextStyle({
  required double fontSize,
  required FontWeight fontWeight,
  required Color color,
}) =>
    TextStyle(
      fontFamily: FontConstants.fontFamily,
      fontSize: fontSize,
      fontWeight: fontWeight,
      color: color,
    );

TextStyle getRegularStyle({
  double fontSize = FontSize.size12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.regular,
      color: color,
    );

TextStyle getMediumStyle({
  double fontSize = FontSize.size12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.medium,
      color: color,
    );

TextStyle getLightStyle({
  double fontSize = FontSize.size12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.light,
      color: color,
    );

TextStyle getBoldStyle({
  double fontSize = FontSize.size12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.bold,
      color: color,
    );

TextStyle getSemiBoldStyle({
  double fontSize = FontSize.size12,
  required Color color,
}) =>
    _getTextStyle(
      fontSize: fontSize,
      fontWeight: FontWeightManger.semiBold,
      color: color,
    );