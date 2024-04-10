import 'package:flutter/material.dart';


double getScreenWidth(BuildContext context) {
  return MediaQuery.of(context).size.width;
}


double getScreenHeight(BuildContext context) {
  return MediaQuery.of(context).size.height;
}


bool isPortrait(BuildContext context) {
  return MediaQuery.of(context).orientation == Orientation.portrait;
}


dynamic isLargeScreen(BuildContext context) {
  final isPortrait = MediaQuery.of(context).orientation == Orientation.portrait;
  final shortSize = isPortrait ? getScreenWidth(context) : getScreenHeight(context);
  final isLargeScreen = shortSize > 600;
  return isLargeScreen;
}
