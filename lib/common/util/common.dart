import 'dart:convert';

import 'package:convert/convert.dart';
import 'package:crypto/crypto.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

///
/// 通用工具
/// chentong
///
class CommonUtil {
  ///退出app
  static void exitApp() async {
    await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  }

  ///加载asset下json文件
  static Future<String> loadAssetJson(String jsonPath) async {
    return await rootBundle.loadString(jsonPath);
  }

  ///image转icon
  static Widget getAssetIcon(String assetImage) {
    return Image(
        image: AssetImage(assetImage),
        width: 24.0,
        height: 24.0,
        fit: BoxFit.scaleDown,
        alignment: Alignment.center,
        color: null);
  }

  static Widget getAssetImage(String assetImage) {
    return Image(image: AssetImage(assetImage), color: null);
  }

  //Padding
  ///padding
  static padding(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return EdgeInsets.only(left: left, top: top, right: right, bottom: bottom);
  }

  static paddingAll(double value) {
    return EdgeInsets.all(value);
  }

  static magining(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    return padding(left: left, top: top, right: right, bottom: bottom);
  }

  static maginingAll(double value) {
    return paddingAll(value);
  }

  ///圆角弧度
  static borderRadiusAll(double value) {
    return BorderRadius.all(Radius.circular(value));
  }

  ///圆角弧度
  static borderRadius(
      {double topLeft = 0.0,
      double topRight = 0.0,
      double bottomLeft = 0.0,
      double bottomRight = 0.0}) {
    var topLeftRadius = Radius.circular(topLeft);
    var topRightRadius = Radius.circular(topRight);
    var bottomLeftRadius = Radius.circular(bottomLeft);
    var bottomRightRadius = Radius.circular(bottomRight);

    return BorderRadius.only(
        topLeft: topLeftRadius,
        topRight: topRightRadius,
        bottomLeft: bottomLeftRadius,
        bottomRight: bottomRightRadius);
  }

  //BoxDecoration
  ///decoration: background
  static background(String assetImage) {
    return BoxDecoration(
      image: DecorationImage(
        image: AssetImage(assetImage),
        fit: BoxFit.fill,
      ),
    );
  }

  static matchParent() {
    return double.infinity;
  }

  ///md5 加密
  static String generateMd5(String data) {
    var content = new Utf8Encoder().convert(data);
    var digest = md5.convert(content);
    // 这里其实就是 digest.toString()
    return hex.encode(digest.bytes);
  }

  ///base64
  static String generateBase64(String data) {
    var bytes = utf8.encode(data);
    return base64.encode(bytes);
  }

  ///  设置宽高 ConstrainedBox
  /// 设置位置
  ///     new Align(
  ///     alignment: FractionalOffset.bottomRight,
  ///     child: new Icon(Icons.map))
  ///

}
