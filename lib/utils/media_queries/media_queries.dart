import 'package:flutter/material.dart';

class MyMediaQueries {
  static MyMediaQueries? _myMediaQueries;
  MyMediaQueries._();
  static MyMediaQueries get instance {
    _myMediaQueries ??= MyMediaQueries._();
    return _myMediaQueries!;
  }

  double getWidthMediaQuery(BuildContext context, [double width = 1]) {
    return MediaQuery.of(context).size.width * width;
  }

  double getHeightMediaQuery(BuildContext context, [double height = 1]) {
    return MediaQuery.of(context).size.width * height;
  }
}
