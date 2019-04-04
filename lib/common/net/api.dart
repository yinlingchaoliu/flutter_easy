import 'dart:async';
import 'dart:collection';
import 'dart:convert';
import 'dart:io';

import 'package:dio/dio.dart' hide Lock;
import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/common/net/exception/code.dart';
import 'package:flutter_easy/common/net/interceptors/log_interceptor.dart';
import 'package:flutter_easy/common/net/interceptors/token_interceptor.dart';
import 'package:flutter_easy/common/net/result_data.dart';
import 'package:synchronized/synchronized.dart' show Lock;
//解决类名冲突

///
/// 重构http请求
/// @author chentong
/// 可以扩展支持post/get请求符合开发正常需求
/// @date 2019-04-02
///
class HttpManager {
  static Dio _dio; // 使用默认配置
  static HttpManager _httpManager;

  static Lock _lock = Lock();
  static final TokenInterceptors _tokenInterceptors = new TokenInterceptors();

  HttpManager._();

  _init() {
    _dio = new Dio();
//    _dio.interceptors.add(new HeaderInterceptors());
    _dio.interceptors.add(_tokenInterceptors);
    _dio.interceptors.add(new LogsInterceptors());
//    _dio.interceptors.add(new ErrorInterceptors(_dio));
//    _dio.interceptors.add(new ResponseInterceptors());
  }

  ///设置参数
  ///公共http header
  ///query path timeout cert
  static void setConfig(HttpBaseConfig config) {
    config.setConfig(_dio, config);
  }

  static void addInterceptor(InterceptorsWrapper interceptors) {
    _dio.interceptors.add(interceptors);
  }

  static Future<HttpManager> getInstance() async {
    if (_httpManager == null) {
      await _lock.synchronized(() async {
        if (_httpManager == null) {
          var singleton = HttpManager._();
          await singleton._init();
          _httpManager = singleton;
        }
      });
    }

    return _httpManager;
  }

  /// is initialized.
  static bool isInitialized() {
    return _httpManager != null;
  }

  ///发起网络请求
  ///[ url] 请求url
  ///[ params] 请求参数
  ///[ header] 外加头
  ///[ option] 配置
  netFetch(url, params, Map<String, dynamic> header, Options option,
      {noTip = false}) async {
    Map<String, dynamic> headers = HashMap();
    if (header != null) {
      headers.addAll(header);
    }

    if (option != null) {
      option.headers = headers;
    } else {
      option = new Options(method: "get");
      option.headers = headers;
    }

    Response response;
    try {
      response = await _dio.request(url, data: params, options: option);
    } on DioError catch (e) {
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: 666);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT ||
          e.type == DioErrorType.RECEIVE_TIMEOUT) {
        errorResponse.statusCode = HttpCode.NETWORK_TIMEOUT;
      }
      return new ResultData(
          HttpCode.errorHandleFunction(
              errorResponse.statusCode, e.message, noTip),
          false,
          errorResponse.statusCode);
    }
    return response.data;
  }

  ///通用请求函数
  static Future<BaseResp<T>> request<T>(BaseReq baseReq,
      {onSendProgress, onReceiveProgress, noTip = false}) async {
    Response response = await _dio.request(baseReq.basePath,
        data: baseReq.baseData,
        queryParameters: baseReq.queryParameters,
        cancelToken: baseReq.cancelToken,
        options: baseReq.options,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress);

    if (response.statusCode == HttpStatus.ok ||
        response.statusCode == HttpStatus.created) {
      try {
        int code = response.statusCode;
        RequestOptions retOption = response.request;

        switch (retOption.responseType) {
          case ResponseType.json:
            T resp;
            if (response.data is Map) {
              resp = baseReq.fromJson(response.data);
            } else {
              Map<String, dynamic> _dataMap = _decodeData(response);
              resp = baseReq.fromJson(_dataMap);
            }
            return new BaseResp(code, resp, response);
          case ResponseType.plain:
            String responseStr = response.data.toString();
            return new BaseResp(code, responseStr as T, response);
          case ResponseType.bytes:
            break;
          case ResponseType.stream:
            break;
        }

        T data = response.data;
        return new BaseResp(code, data, response);
      } catch (e) {
        return new Future.error(new DioError(
          response: response,
          message: "data parsing exception...",
          type: DioErrorType.RESPONSE,
        ));
      }
    }

    ///异常错误通用处理
    HttpCode.errorHandleFunction(response.statusCode, "错误分发", noTip);
    return new Future.error(new DioError(
      response: response,
      message: "statusCode: $response.statusCode, service error",
      type: DioErrorType.RESPONSE,
    ));
  }

  /// decode response data.
  static Map<String, dynamic> _decodeData(Response response) {
    if (response == null ||
        response.data == null ||
        response.data.toString().isEmpty) {
      return new Map();
    }
    return json.decode(response.data.toString());
  }

  ///清除授权
  static clearAuthorization() {
    _tokenInterceptors.clearAuthorization();
  }

  ///获取授权token
  getAuthorization() async {
    return _tokenInterceptors.getAuthorization();
  }
}
