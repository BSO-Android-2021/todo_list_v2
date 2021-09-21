import 'package:flutter/material.dart';
import 'package:todo_list/pages/home.dart';


enum StyleType { type1, type2, type3, primary1, primary2, primary3, black1, black2, black3 }


//custom textstyle
  TextStyle myCustomTextStyle(StyleType type) {
    switch (type) {
      case StyleType.type1:
        return const TextStyle(
            color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold);
      case StyleType.type2:
        return const TextStyle(
            color: Colors.white, fontSize: 14, fontWeight: FontWeight.normal);
      case StyleType.type3:
        return const TextStyle(
            color: Colors.white, fontSize: 12, fontWeight: FontWeight.w600);
      case StyleType.primary1:
        return const TextStyle(
            color: primaryColor, fontSize: 16, fontWeight: FontWeight.bold);
      case StyleType.primary2:
        return const TextStyle(
            color: primaryColor, fontSize: 14, fontWeight: FontWeight.normal);
      case StyleType.primary3:
        return const TextStyle(
            color: primaryColor, fontSize: 12, fontWeight: FontWeight.w600);
      case StyleType.black1:
        return const TextStyle(
            color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold);
      case StyleType.black2:
        return const TextStyle(
            color: Colors.black, fontSize: 14, fontWeight: FontWeight.normal);
      case StyleType.black3:
        return const TextStyle(
            color: Colors.black, fontSize: 12, fontWeight: FontWeight.w600);
      default:
        return const TextStyle(color: Colors.white);
    }
  }
