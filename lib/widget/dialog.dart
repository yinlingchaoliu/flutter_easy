import 'package:flutter/material.dart';

class CustomWidget {
  ///dialog
  ///
  static customDialog(BuildContext context) {
    showDialog(
        context: context,
        builder: (_) {
          return AlertDialog(
              title: new Text("我是标题"),
              content: new Text("我是内容"),
              actions: <Widget>[
                new FlatButton(
                  child: new Text("确定"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                new FlatButton(
                  child: new Text("取消"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                )
              ]);
        });
  }
}
