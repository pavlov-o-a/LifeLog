import 'package:flutter/material.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Container(
        child: Column(
          children: [
            getHeader("Sync services"),
            getItem("Google drive"),
          ],
        ),
        constraints: BoxConstraints.expand(),
      ),
    );
  }

  Widget getHeader(String title) {
    return Container(
      child: Text(
        title,
        style: TextStyle(fontSize: 18),
      ),
      color: Colors.black12,
      padding: EdgeInsets.only(left: 20, top: 10, bottom: 10, right: 20),
      width: double.infinity,
    );
  }

  Widget getItem(String title) {
    return Container(
      child: TextButton(
        child: Text(
          title,
          style: TextStyle(color: Colors.black),
        ),
        onPressed: () => {},
        style: getSimpleStyle(),
      ),
      width: double.infinity,
      height: 40,
    );
  }

  ButtonStyle getSimpleStyle() {
    return ButtonStyle(
        padding: MaterialStateProperty.all(EdgeInsets.only(left: 30)),
        alignment: Alignment.centerLeft,
        minimumSize: MaterialStateProperty.all(Size.zero),
        textStyle: MaterialStateProperty.all(TextStyle(color: Colors.black)));
  }
}
