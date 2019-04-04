import 'dart:convert';

import 'package:flutter_easy/common/net/api.dart';
import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/common/util/sputil.dart';
import 'package:flutter_easy/config/address.dart';
import 'package:flutter_easy/config/config.dart';
import 'package:flutter_easy/netbean/login_request.dart';

///
/// chentong
/// 网络接口仓库
///
class GithubRepository {
  ///登录请求
  static Future<BaseResp<LoginRequest>> login(
      String userName, String password) async {
    String type = userName + ":" + password;
    var bytes = utf8.encode(type);
    var base64Str = base64.encode(bytes);

    SpUtil.put(Config.USER_NAME_KEY, userName);
    SpUtil.put(Config.USER_BASIC_CODE, base64Str);

    //登录之前首先清除令牌
    HttpManager.clearAuthorization();

    LoginBean bean = LoginBean();
    LoginRequest loginRequest = LoginRequest();

    loginRequest.initOption(
        Method.post, Address.getAuthorization(), bean.toJson());

    ///网络请求
    return await HttpManager.request<LoginRequest>(loginRequest);
  }

  ///新接口...

}
