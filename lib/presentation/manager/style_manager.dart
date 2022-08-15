import 'package:flutter/material.dart';
import 'package:muslim/presentation/manager/assets_manager/fonts.dart';

TextStyle _getTextStyle({
  required Color color,
  required FontWeight fontWeight,
  required double fontSize,
  String fontFamily = 'URW',
}) {
  return TextStyle(
    color: color,
    fontWeight: fontWeight,
    fontSize: fontSize,
    fontFamily: fontFamily,
  );
}

// light
getLightStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
  );
}

// regular
getRegularStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w500,
    fontSize: fontSize,
  );
}

// medium
getMediumStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w600,
    fontSize: fontSize,
  );
}



// Bold
getBoldStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.bold,
    fontSize: fontSize,
  );
}

// light
getQuraanStyle({
  required Color color,
  required double fontSize,
}) {
  return _getTextStyle(
    color: color,
    fontWeight: FontWeight.w400,
    fontSize: fontSize,
    fontFamily: FontsManager.quraan
  );
}


