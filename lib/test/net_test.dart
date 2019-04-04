import 'package:dio/dio.dart';
import 'package:flutter_easy/repository/github_repository.dart';
import 'package:fluttertoast/fluttertoast.dart';

///chentong
///2019-4-4
class TestNet {
  ///测试登录接口
  static void testLogin() async {
    await GithubRepository.login("704514698@qq.com", "Heat1314")
        .then((baseResp) {
      Fluttertoast.showToast(msg: "用户id" + baseResp.data.id.toString());
    }).catchError((err) {
      DioError dioError = err as DioError;
      Fluttertoast.showToast(msg: dioError.message);
    });
  }
}
