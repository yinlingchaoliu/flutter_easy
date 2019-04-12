import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/arouter/routers.dart';
import 'package:flutter_easy/common/net/api.dart';
import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/common/util/sputil.dart';

///
/// @author chentong
/// 2019-4-4
///
class App {
  static SpUtil spUtil;
  static HttpManager httpManager;

  //页面路由跳转
  static RouterManager routerManager;

  static rehotfix() {
    init();
  }

  static init() async {
    ///初始化sp
    spUtil = await SpUtil.getInstance();
    httpManager = await _initHttp();
    await _initRoute();
  }

  ///初始化网络
  static _initHttp() async {
    HttpBaseConfig config = HttpBaseConfig(
      options: HttpBaseConfig.getDefOptions(),
      contentType: Utils.getContentType(ParseType.JSON),
      receiveTimeout: 1000 * 10,
      connectTimeout: 1000 * 20,
    );
    HttpManager.setConfig(config);
    HttpBaseConfig.openDebug();
    if (!HttpManager.isInitialized()) {
      await HttpManager.getInstance();
    }
  }

  ///初始化路由
  static _initRoute() async {
    routerManager = await RouterManager.getInstance();
    Routes.configureRoutes(RouterManager.router);
  }
}
