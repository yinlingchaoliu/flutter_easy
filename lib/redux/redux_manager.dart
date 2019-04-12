import 'dart:async';

import 'package:synchronized/synchronized.dart';

/// 单例快速开发工具
/// @author chentong
/// @date 2019-04-01
///
/// 事件流程--》action->dispatch->
///
///
class ReduxManager {
  static ReduxManager _singleton;
  static Lock _lock = Lock();

  ReduxManager._();

  Future _init() async {
    ///TODO:增加初始化代码
  }

  ///需要初始化 ReduxManager.getInstance()
  static Future<ReduxManager> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = ReduxManager._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }

    return _singleton;
  }
}
