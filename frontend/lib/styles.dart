import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';

abstract class Styles {
  static const TextStyle productRowItemName = TextStyle(
    color: Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 21,
    fontStyle: FontStyle.normal,
    fontFamily: 'Abel',
    fontWeight: FontWeight.normal,
  );

  static const TextStyle productRowTotal = TextStyle(
    // color: Color.fromRGBO(0, 0, 0, 0.8),
    color: Color.fromRGBO(255, 255, 255, 0.8),
    fontSize: 18,
    fontFamily: 'Abel',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.bold,
  );

  static const TextStyle productRowItemPrice = TextStyle(
    color: Color(0xFF8E8E93),
    fontSize: 13,
    fontFamily: 'Abel',
    fontWeight: FontWeight.w300,
  );

  static const TextStyle searchText = TextStyle(
    color: Color.fromRGBO(0, 0, 0, 1),
    fontSize: 14,
    fontFamily: 'Abel',
    fontStyle: FontStyle.normal,
    fontWeight: FontWeight.normal,
  );

  static const TextStyle deliveryTimeLabel = TextStyle(
    color: Color(0xFFC2C2C2),
    fontFamily: 'Abel',
    fontWeight: FontWeight.w300,
  );

  static const TextStyle deliveryTime = TextStyle(
    color: CupertinoColors.inactiveGray,
    fontFamily: 'Abel',
  );

  static const Color productRowDivider = Color(0xFF000000);

  static const Color scaffoldBackground = Color(0xFFFBC02D);

  static const Color searchBackground = Color(0xffe0e0e0);

  // static const Color searchCursorColor = Color.fromRGBO(0, 122, 255, 1);
  static const Color searchCursorColor = Color(0xFF000000);

  // static const Color searchIconColor = Color.fromRGBO(128, 128, 128, 1);
  static const Color searchIconColor = Color(0xFF000000);
}
