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

  ///  设置宽高 ConstrainedBox
  ///

  /// 设置位置
  ///     new Align(
  ///     alignment: FractionalOffset.bottomRight,
  ///     child: new Icon(Icons.map))
  ///

}
