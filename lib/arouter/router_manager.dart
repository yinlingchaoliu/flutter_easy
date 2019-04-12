import 'dart:async';

import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:synchronized/synchronized.dart';

/// 单例快速开发工具
/// @author chentong
/// @date 2019-04-01
///
class RouterManager {
  static RouterManager _singleton;
  static Lock _lock = Lock();
  static Router _router;

  RouterManager._();

  Future _init() async {
    _router = Router();
  }

  ///需要初始化 RouterManager.getInstance()
  static Future<RouterManager> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = RouterManager._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }

    return _singleton;
  }

  static get router => _router;

  ///路由生成器
  static generator() {
    return _router.generator;
  }

  /// 页面路由跳转
  static navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      TransitionType transition,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    _router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transition: transition,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder);
  }

  ///Application.router.navigateTo(context,
  ///'${Routes.webViewPage}?title=${Uri.encodeComponent(widget.title)} Doc&&url=${Uri.encodeComponent(widget.docUrl)}');
}
