import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_easy/common/net/exception/code.dart';
import 'package:flutter_easy/common/net/result_data.dart';

///是否需要弹提示
const NOT_TIP_KEY = "noTip";

/// 错误拦截
/// Created by guoshuyu
/// on 2019/3/23.
class ErrorInterceptors extends InterceptorsWrapper {
  final Dio _dio;

  ErrorInterceptors(this._dio);

  @override
  onRequest(RequestOptions options) async {
    //没有网络
    var connectivityResult = await (new Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
      return _dio.resolve(new ResultData(
          HttpCode.errorHandleFunction(HttpCode.NETWORK_ERROR, "", false),
          false,
          HttpCode.NETWORK_ERROR));
    }
    return options;
  }
}
