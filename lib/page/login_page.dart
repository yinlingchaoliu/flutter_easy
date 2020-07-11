import 'package:dio/dio.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/arouter/routers.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/config/config.dart';
import 'package:flutter_easy/repo/api_repository.dart';
import 'package:flutter_easy/res/res_index.dart';
import 'package:fluttertoast/fluttertoast.dart';

///@author: chentong
///2019-4-9
///视图层
class LoginPage extends StatefulWidget {
  ///路由跳转
  static void pushLoginPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<LoginBloc>(
                  child: new LoginPage(),
                  bloc: new LoginBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<LoginBloc>(
      child: new LoginPage(),
      bloc: new LoginBloc(),
    );
  }

  @override
  _LoginPageState createState() => new _LoginPageState();
}

///
/// 页面实现
///
class _LoginPageState extends State<LoginPage> {
  ///设置UI操作标识
  GlobalKey<FormFieldState> phoneKey = new GlobalKey<FormFieldState>();
  GlobalKey<FormFieldState> passwdKey = new GlobalKey<FormFieldState>();

  LoginBloc bloc;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bloc = BlocProvider.of<LoginBloc>(context);

    return new Scaffold(
        backgroundColor: Colors.white,

        ///todo SingleChildScrollView 包一层，解决输入法弹出，空间溢出错误
        body: new SingleChildScrollView(
            child: new Container(
                margin: CommonUtil.padding(left: 30, right: 30),
                child: new Column(
                  children: <Widget>[
                    new Container(
                      height: 65,
                      child: new Row(
                        children: <Widget>[
                          new WidgetDecoration(Image.asset(
                            AppIcons.ICON_PHONE,
                            height: 18,
                          )).align().build(),
                          new WidgetDecoration(new TextFormField(
                            key: phoneKey,
                            decoration: InputDecoration(
                              hintText: "请输入手机号",
                              contentPadding: CommonUtil.padding(left: 10),
                              border: InputBorder.none,
                            ),
                            style: new TextStyle(
                                fontSize: 16, color: Colors.black),
                            keyboardType: TextInputType.phone,
                            onSaved: (value) {
                              bloc.userName = value;
                            },
//                          obscureText: true,
                            validator: (value) {
                              return "123";
                            },
                          )).align().expanded().build()
                        ],
                      ),
                    ),
                    CommonWidget.getDivider(), //分割线
                    new Container(
                      height: 65,
                      child: new Row(
                        children: <Widget>[
                          new WidgetDecoration(Image.asset(
                            AppIcons.ICON_IDCODE,
                            height: 18,
                          )).align().build(),
                          new WidgetDecoration(new TextFormField(
                            key: passwdKey,
                            decoration: InputDecoration(
                              hintText: "请输入登录密码",
                              contentPadding: CommonUtil.padding(left: 10),
                              border: InputBorder.none,
                            ),
                            style: new TextStyle(
                                fontSize: 16, color: Colors.black),
                            keyboardType: TextInputType.text,
                            onSaved: (value) {
                              bloc.userPasswd = value;
                            },
                            obscureText: true,
                            validator: (value) {
                              return "456";
                            },
                          )).align().expanded().build()
                        ],
                      ),
                    ),
                    CommonWidget.getDivider(), //分割线
                    new WidgetDecoration(CommonWidget.getLoginRaisedButton(
                            text: '登录', onPressed: _login))
                        .padding(top: 60, left: 50, right: 50)
                        .build(),
                  ],
                ))));
  }

  ///登录
  void _login() {
    var phoneForm = phoneKey.currentState;
    var passwdForm = passwdKey.currentState;
    phoneForm.save();
    passwdForm.save();
    //网络调用代码先注掉
//    bloc.login(() {
//      ///去往主页
//      RouterManager.navigateReplaceTo(context, Routes.home_page,
//          transition: TransitionType.inFromRight);
//    });

    ///去往主页
    RouterManager.navigateReplaceTo(context, Routes.home_page,
        transition: TransitionType.inFromRight);
  }

  @override
  void dispose() {
    super.dispose();
  }
}

///
///逻辑层
///todo:此处逻辑建议迁移出去 分离开解耦
///
class LoginBloc extends BlocBase {
  String userName = "", userPasswd = "";

  ///登录
  void login(Function loginComplete) {
    ApiRepository.login(userName, userPasswd).then((baseResp) {
      if (baseResp.data.code == 200) {
        SpUtil.putString(Constants.TELE_KEY, userName);
        SpUtil.putString(
            Constants.USERID_KEY, baseResp.data.data.userId.toString());
        SpUtil.putString(Constants.PWD_KEY, CommonUtil.generateMd5(userPasswd));
        SpUtil.putBool(Constants.ISLOGIN_KEY, true);
        showToast(baseResp.data.msg);
        loginComplete();
      } else {
        showToast(baseResp.data.msg);
      }
    }).catchError((err) {
      DioError dioError = err as DioError;
      Fluttertoast.showToast(msg: dioError.message);
    });
  }

  @override
  void initState() {}

  @override
  void dispose() {}

  void showToast(String msg) {
    Fluttertoast.showToast(msg: msg);
  }
}
