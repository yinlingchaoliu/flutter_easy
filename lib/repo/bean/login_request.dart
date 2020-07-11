import 'package:flutter_easy/common/net/bean/baseresp.dart';

class LoginBean {
  String phone;
  String password;
  int type = 1;
  String smsCode = "";
  int versionCode = 1800;
  String osType = "android";
  String userId = "";

  LoginBean(this.phone, this.password);

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['phone'] = this.phone;
    data['password'] = this.password;
    data['type'] = this.type;
    data['smsCode'] = this.smsCode;
    data['osType'] = this.osType;
    data['userId'] = this.userId;
    return data;
  }
}

// todo 继承 baseReq
class LoginRequest extends BaseReq {
  int code;
  String msg;
  Data data;

  LoginRequest({this.code, this.msg, this.data});

  fromJson(Map<String, dynamic> json) {
    code = json['code'];
    msg = json['msg'];
    //todo 增加判空校验 isNotEmpty
    data = json['data'] != null && json['data'].isNotEmpty
        ? new Data.fromJson(json['data'])
        : null;
    // todo 必须加上
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['msg'] = this.msg;
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int userId;
  String token;

  Data({this.userId, this.token});

  Data.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['userId'] = this.userId;
    data['token'] = this.token;
    return data;
  }
}
