import 'package:dio/dio.dart';
import 'package:flutter_easy/common/net/bean/baseresp.dart';

/// Log 拦截器
/// Created by guoshuyu
/// on 2019/3/23.
///
class LogsInterceptors extends InterceptorsWrapper {
  @override
  onRequest(RequestOptions options) {
    if (HttpBaseConfig.isDebug()) {
      print("http_请求url：${options.path}");
      print('http_请求头: ' + options.headers.toString());
      if (options.data != null) {
        print('http_请求参数: ' + options.data.toString());
      }
    }
    return options;
  }

  @override
  onResponse(Response response) {
    if (HttpBaseConfig.isDebug()) {
      if (response != null) {
        print('http_返回参数: ' + response.toString());
      }
    }
    return response; // continue
  }

  @override
  onError(DioError err) {
    if (HttpBaseConfig.isDebug()) {
      print('http_请求异常: ' + err.toString());
      print('http_请求异常信息: ' + err.response?.toString() ?? "");
    }
    return err;
  }
}
