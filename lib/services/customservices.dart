import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:gp/pages/EnterAmount.dart';
import 'package:shared_preferences/shared_preferences.dart';

parseUPI(BuildContext context, String upi) {
  // upi://pay?pa=paytmqr281005050101fgncoc9c8pwx@paytm&pn=Paytm Merchant&mc=5499&mode=02&orgid=000000&paytmqr=281005050101FGNCOC9C8PWX&sign=MEYCIQDjp8h9LKh/SDvy7xXEG8Mrh8yGWtfubLYTQKA9cws9GwIhALvuwbILbzuKMyNO6N2+r4itBdjWHV+t74o89uzXXmRt
  upi = upi.replaceAll('upi://pay?', '');
  List<String> upiList = upi.split('&');
  Map<String, String> upiMap = {};
  for (String upiItem in upiList) {
    List<String> upiItemSplit = upiItem.split('=');
    upiMap[upiItemSplit[0]] = upiItemSplit[1];
  }
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (context) => EnterAmount(
        upiMap: upiMap,
      ),
    ),
  );
}

saveListToSharedPref(List<dynamic> list) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs.setString("data", jsonEncode(list));
}

Future<List<dynamic>> getListFromSharedPref() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  String? data = prefs.getString("data");
  if (data == null) {
    return [];
  } else {
    return jsonDecode(data);
  }
}
