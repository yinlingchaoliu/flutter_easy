import 'dart:async';

import 'package:synchronized/synchronized.dart';

/// 单例快速开发工具
/// @author chentong
/// @date 2019-04-01
///
class Manager {
  static Manager _singleton;
  static Lock _lock = Lock();

  Manager._();

  Future _init() async {
    ///TODO:增加初始化代码
  }

  ///需要初始化 Manager.getInstance()
  static Future<Manager> getInstance() async {
    if (_singleton == null) {
      await _lock.synchronized(() async {
        if (_singleton == null) {
          var singleton = Manager._();
          await singleton._init();
          _singleton = singleton;
        }
      });
    }

    return _singleton;
  }
}
