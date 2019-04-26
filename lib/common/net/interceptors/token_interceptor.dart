import 'package:dio/dio.dart';
import 'package:flutter_easy/common/net/config/config.dart';
import 'package:flutter_easy/common/util/sputil.dart';

/// Token拦截器
/// Created by guoshuyu
/// todo:拦截器不建议写在通用层common,除非极其通用
/// on 2019/3/23.
class TokenInterceptors extends InterceptorsWrapper {
  String _token;

  @override
  onRequest(RequestOptions options) async {
    //授权码
    if (_token == null) {
      var authorizationCode = await getAuthorization();
      if (authorizationCode != null) {
        _token = authorizationCode;
      }
    }
    options.headers["Authorization"] = _token;
    return options;
  }

  @override
  onResponse(Response response) async {
    try {
      var responseJson = response.data;
      if (response.statusCode == 201 && responseJson["token"] != null) {
        _token = 'token ' + responseJson["token"];
        SpUtil.put(Config.TOKEN_KEY, _token);
      }
    } catch (e) {
      print(e);
    }
    return response;
  }

  ///清除授权
  clearAuthorization() {
    this._token = null;
    SpUtil.remove(Config.TOKEN_KEY);
  }

  ///获取授权token
  getAuthorization() async {
    String token = SpUtil.get(Config.TOKEN_KEY, null);
    if (token == null) {
      String basic = SpUtil.get(Config.USER_BASIC_CODE, null);
      if (basic == null) {
        //提示输入账号密码
      } else {
        //通过 basic 去获取token，获取到设置，返回token
        return "Basic $basic";
      }
    } else {
      this._token = token;
      return token;
    }
  }
}
