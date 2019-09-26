import 'package:flutter/material.dart';

AppBar header(context, {bool isAppTitle = false, String titleText}) {
  return AppBar(
    title: Text(
      isAppTitle ? "Agorinha" : titleText,
      style: TextStyle(
        fontSize: isAppTitle ? 50 : 22,
        fontFamily: isAppTitle ? "Signatra" : "",
        color: Colors.white,
      ),
    ),
    centerTitle: true,
    backgroundColor: Theme.of(context).accentColor,
  );
}
