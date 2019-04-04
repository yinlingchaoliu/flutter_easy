import 'package:flutter_easy/common/net/api.dart';
import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/common/util/sputil.dart';

///
/// @author chentong
/// 2019-4-4
///
class App {
  static init() async {
    ///初始化sp
    await SpUtil.getInstance();
    await initHttp();
  }

  ///初始化网络
  static initHttp() async {
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
}
