import 'package:flutter_easy/common/net/api.dart';
import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/config/urls.dart';

import 'bean/login_request.dart';

///
/// 网络通讯仓库
/// author:chentong
///
class ApiRepository {
  ///登录请求
  static Future<BaseResp<LoginRequest>> login(
      String userName, String password) async {
    String md5Str = CommonUtil.generateMd5(password);
    LoginBean bean = LoginBean(userName, md5Str);
    LoginRequest loginRequest = LoginRequest();

    ///设置请求参数
    loginRequest.initOption(
        Method.post, Urls.LOGIN_INTERFACENAME, bean.toJson(),
        contentType: ParseType.URL_ENCODED);

    ///网络请求
    return await HttpManager.request<LoginRequest>(loginRequest);
  }
}
