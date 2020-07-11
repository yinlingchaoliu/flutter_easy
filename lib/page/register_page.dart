import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/res/res_index.dart';
import 'package:fluttertoast/fluttertoast.dart';

///@author: chentong
///2019-4-9
///视图层
class RegisterPage extends StatefulWidget {
  ///路由跳转
  static void pushRegisterPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<RegisterBloc>(
                  child: new RegisterPage(),
                  bloc: new RegisterBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<RegisterBloc>(
      child: new RegisterPage(),
      bloc: new RegisterBloc(),
    );
  }

  @override
  _RegisterPageState createState() => new _RegisterPageState();
}

///
/// 页面实现
///
class _RegisterPageState extends State<RegisterPage> {
  bool check = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = BlocProvider.of<RegisterBloc>(context);

    return new Scaffold(
        backgroundColor: Colors.white,
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
                      decoration: InputDecoration(
                        hintText: "请输入手机号",
                        contentPadding: CommonUtil.padding(left: 10),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                      keyboardType: TextInputType.phone,
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
                      decoration: InputDecoration(
                        hintText: "请输入验证码",
                        contentPadding: CommonUtil.padding(left: 10),
                        border: InputBorder.none,
                      ),
                      style: new TextStyle(fontSize: 16, color: Colors.black),
                      keyboardType: TextInputType.number,
                    )).align().expanded().build(),
                    new WidgetDecoration(new Text(
                      "获取验证码",
                      style: new TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: AppColors.blue_normal),
                    ))
                        .align(alignment: Alignment.centerRight)
                        .padding(right: 10)
                        .onTap(() {
                          Fluttertoast.showToast(msg: '验证码给你');
                        })
                        .expanded(flex: 2)
                        .build()
                  ],
                ),
              ),
              CommonWidget.getDivider(), //分割线
              new Container(
                margin: CommonUtil.padding(top: 10),
                child: new Row(
                  children: <Widget>[
                    new WidgetDecoration(new Checkbox(
                        value: check,
                        activeColor: AppColors.blue_normal,
                        onChanged: (status) {
                          setState(() {
                            check = !check;
                          });
                        })).sizedBox(width: 8, height: 8).padding(left: 5, right: 10).build(),
                    new Text(
                      "我已阅读并同意",
                      style: new TextStyle(fontSize: 12, color: Colors.grey.shade800),
                    ),
                    new WidgetDecoration(new Text("《用户注册协议》",
                            style: new TextStyle(fontSize: 12, color: AppColors.blue_normal)))
                        .onTap(() {
                      Fluttertoast.showToast(msg: '协议也给你看');
                    }).build(),
                  ],
                ),
              ),
              new WidgetDecoration(CommonWidget.getLoginRaisedButton(text: '注册', onPressed: () {}))
                  .padding(top: 35, left: 50, right: 50)
                  .build(),
            ],
          ),
        )));
    ;
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
class RegisterBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
