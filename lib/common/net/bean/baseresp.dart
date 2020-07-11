import 'dart:collection';
import 'dart:io';

import 'package:dio/dio.dart';

///请求扩展类
///chentong
abstract class BaseReq {
  String basePath;
  dynamic baseData;

  Map<String, dynamic> queryParameters = new HashMap();
  Map<String, dynamic> headers = new HashMap();

  Options options = new Options();
  CancelToken cancelToken = new CancelToken();

  ///重新封装当前options
  initOption(String method, String path, dynamic baseData,
      {headers,
      queryParameters,
      cookies,
      extra,
      responseType,
      ParseType contentType = ParseType.URL_ENCODED}) {
    mergeOption(
        method: method,
        path: path,
        baseData: baseData, //base数据
        headers: headers,
        queryParameters: queryParameters, //query
        cookies: cookies,
        extra: extra,
        responseType: responseType,
        contentType: contentType);
  }

  ///追加参数
  mergeOption(
      {method,
      path,
      baseData,
      headers,
      queryParameters,
      cookies,
      extra,
      responseType,
      contentType}) {
    if (options == null) {
      options = new Options();
    }
    options.method = method ?? options.method;
    options.cookies = cookies ?? options.cookies;
    options.extra = extra ?? options.extra;
    options.headers = headers ?? options.headers ?? this.headers;
    options.responseType = responseType ?? options.responseType;
    options.contentType = Utils.getContentType(contentType);

    if (options.method == "GET") {
      this.baseData = null;
      queryParameters = baseData ?? this.queryParameters;
    } else {
      this.baseData = baseData ?? this.baseData;
      this.queryParameters = queryParameters ?? this.queryParameters;
    }
    this.basePath = path ?? this.basePath;
  }

  ///取消网络请求
  void cancelRequest() {
    cancelToken.cancel("cancelled");
  }

  ///Response 转响应实体类
  fromJson(Map<String, dynamic> json);

  ///转化为map
  Map<String, dynamic> toJson();
}

/// <BaseRespR<T> 返回 status code msg data Response.
class BaseResp<T> {
  int code;
  T data;
  Response response;

  bool isSuccessful() {
    return code == 200;
  }

  BaseResp(this.code, this.data, this.response);

  @override
  String toString() {
    StringBuffer sb = new StringBuffer('{');
    sb.write(",\"code\":$code");
    sb.write(",\"data\":\"$data\"");
    sb.write('}');
    return sb.toString();
  }
}

/// 请求方法.
class Method {
  static final String get = "GET";
  static final String post = "POST";
  static final String put = "PUT";
  static final String head = "HEAD";
  static final String delete = "DELETE";
  static final String patch = "PATCH";
}

enum ParseType { URL_ENCODED, JSON, MULTIPART }

/// 请求方法.
class Utils {
  static getContentType(ParseType type) {
    switch (type) {
      case ParseType.URL_ENCODED:
        return ContentType.parse("application/x-www-form-urlencoded");
      case ParseType.JSON:
        return ContentType.parse("application/json");
      case ParseType.MULTIPART:
        return ContentType.parse("multipart/form-data");
    }
  }
}

///support https baseoption
///header
class HttpBaseConfig {
  /// constructor.
  HttpBaseConfig({
    this.options,
    this.baseUrl,
    this.method,
    this.connectTimeout,
    this.receiveTimeout,
    this.cookies,
    this.queryParameters,
    this.extra,
    this.headers,
    this.responseType,
    this.contentType,
    this.validateStatus,
    this.pem,
    this.pKCSPath,
    this.pKCSPwd,
  }) {
    this.options.baseUrl = baseUrl ?? defalutOptions.baseUrl;
    this.options.method = method ?? defalutOptions.method;
    this.options.connectTimeout =
        connectTimeout ?? defalutOptions.connectTimeout;
    this.options.receiveTimeout =
        receiveTimeout ?? defalutOptions.receiveTimeout;
    this.options.cookies = cookies ?? defalutOptions.cookies;
    this.options.queryParameters =
        queryParameters ?? defalutOptions.queryParameters;
    this.options.extra = extra ?? defalutOptions.extra;
    this.options.headers = headers ?? defalutOptions.headers;
    this.options.responseType = responseType ?? defalutOptions.responseType;
    this.options.contentType = contentType ?? defalutOptions.contentType;
    this.options.validateStatus =
        validateStatus ?? defalutOptions.validateStatus;
  }

  String baseUrl;
  String method;
  int connectTimeout;
  int receiveTimeout;

  Iterable<Cookie> cookies = new List();
  Map<String, dynamic> queryParameters = new HashMap();

  Map<String, dynamic> extra = new HashMap();

  ///公共header头
  Map<String, dynamic> headers = new HashMap();

  ResponseType responseType = ResponseType.json;
  ContentType contentType;

  ValidateStatus validateStatus;

  /// 是否是debug模式.
  static bool _isDebug = false;

  /// Options.
  BaseOptions options = getDefOptions();

  ///默认值
  BaseOptions defalutOptions = getDefOptions();

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PEM证书内容.
  String pem;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书路径.
  String pKCSPath;

  /// 详细使用请查看dio官网 https://github.com/flutterchina/dio/blob/flutter/README-ZH.md#Https证书校验.
  /// PKCS12 证书密码.
  String pKCSPwd;

  /// 打开debug模式.
  static void openDebug() {
    _isDebug = true;
  }

  static bool isDebug() {
    return _isDebug;
  }

  /// set Config.
  void setConfig(Dio dio, HttpBaseConfig config) {
    if (dio != null) {
      _mergeOption(dio, config.options);
      if (pem != null) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          client.badCertificateCallback =
              (X509Certificate cert, String host, int port) {
            if (cert.pem == pem) {
              // 证书一致，则放行
              return true;
            }
            return false;
          };
        };
      }

      if (pKCSPath != null) {
        (dio.httpClientAdapter as DefaultHttpClientAdapter).onHttpClientCreate =
            (HttpClient client) {
          SecurityContext sc = new SecurityContext();
          //file为证书路径
          sc.setTrustedCertificates(pKCSPath, password: pKCSPwd);
          HttpClient httpClient = new HttpClient(context: sc);
          return httpClient;
        };
      }
    }
  }

  void _mergeOption(Dio dio, BaseOptions opt) {
    dio.options.method = opt.method ?? defalutOptions.method;
    dio.options.headers = (new Map.from(defalutOptions.headers))
      ..addAll(opt.headers);
    dio.options.baseUrl = opt.baseUrl ?? defalutOptions.baseUrl;
    dio.options.connectTimeout =
        opt.connectTimeout ?? defalutOptions.connectTimeout;
    dio.options.receiveTimeout =
        opt.receiveTimeout ?? defalutOptions.receiveTimeout;
    dio.options.responseType = opt.responseType ?? defalutOptions.responseType;
    dio.options.extra = (new Map.from(defalutOptions.extra))..addAll(opt.extra);
    dio.options.contentType = opt.contentType ?? defalutOptions.contentType;
    dio.options.validateStatus =
        opt.validateStatus ?? defalutOptions.validateStatus;
    dio.options.followRedirects =
        opt.followRedirects ?? defalutOptions.followRedirects;
  }

  /// get Def Options.
  static BaseOptions getDefOptions() {
    BaseOptions options = new BaseOptions();
    options.contentType =
        ContentType.parse("application/x-www-form-urlencoded");
    options.connectTimeout = 1000 * 10;
    options.receiveTimeout = 1000 * 20;
    return options;
  }
}
