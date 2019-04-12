import 'package:flutter_easy/common/net/bean/baseresp.dart';
import 'package:flutter_easy/config/net_config.dart';

class LoginBean {
  List<String> scopes = ['user', 'repo', 'gist', 'notifications'];
  String note = "admin_script";
  String clientId = NetConfig.CLIENT_ID;
  String clientSecret = NetConfig.CLIENT_SECRET;

  LoginBean();

  LoginBean.fromJson(Map<String, dynamic> json) {
    scopes = json['scopes'].cast<String>();
    note = json['note'];
    clientId = json['client_id'];
    clientSecret = json['client_secret'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['scopes'] = this.scopes;
    data['note'] = this.note;
    data['client_id'] = this.clientId;
    data['client_secret'] = this.clientSecret;
    return data;
  }
}

class LoginRequest extends BaseReq {
  int id;
  String url;
  App app;
  String token;
  String hashedToken;
  String tokenLastEight;
  String note;
  Null noteUrl;
  String createdAt;
  String updatedAt;
  List<String> scopes;
  Null fingerprint;

  LoginRequest(
      {this.id,
      this.url,
      this.app,
      this.token,
      this.hashedToken,
      this.tokenLastEight,
      this.note,
      this.noteUrl,
      this.createdAt,
      this.updatedAt,
      this.scopes,
      this.fingerprint});

  fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    app = json['app'] != null ? new App.fromJson(json['app']) : null;
    token = json['token'];
    hashedToken = json['hashed_token'];
    tokenLastEight = json['token_last_eight'];
    note = json['note'];
    noteUrl = json['note_url'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    scopes = json['scopes'].cast<String>();
    fingerprint = json['fingerprint'];
    return this;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    if (this.app != null) {
      data['app'] = this.app.toJson();
    }
    data['token'] = this.token;
    data['hashed_token'] = this.hashedToken;
    data['token_last_eight'] = this.tokenLastEight;
    data['note'] = this.note;
    data['note_url'] = this.noteUrl;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['scopes'] = this.scopes;
    data['fingerprint'] = this.fingerprint;
    return data;
  }
}

class App {
  String name;
  String url;
  String clientId;

  App({this.name, this.url, this.clientId});

  App.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    url = json['url'];
    clientId = json['client_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['url'] = this.url;
    data['client_id'] = this.clientId;
    return data;
  }
}
