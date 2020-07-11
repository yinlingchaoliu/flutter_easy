import 'package:flutter/material.dart';

///
/// 统一bar效果
///
class AppBars {
  ///默认bar效果
  static AppBar getDefaultAppBar(String title) {
    return new AppBar(
      title: new Text(title),
      centerTitle: true,
      iconTheme: IconThemeData(color: Colors.black),
      backgroundColor: Colors.white,
      // 使用背景颜色
      elevation: 0.5,
      // 阴影长度
    );
  }

  ///获得统一的bar效果
  static AppBar getAppBar(String title, String rightText) {
    return new AppBar(
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        // 使用背景颜色
        elevation: 0.5,
        // 阴影长度
        centerTitle: true,
        title: new Text(title),
        actions: <Widget>[
          new Container(
            child: FlatButton(
              onPressed: () {},
              child: Text(rightText),
            ),
            width: 100,
          ),
        ]);
  }
}
