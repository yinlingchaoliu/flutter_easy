import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/res/res_index.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RegisterBloc bloc = BlocProvider.of<RegisterBloc>(context);

    return new Scaffold(
        backgroundColor: Colors.white,
        body: Container(
          padding: EdgeInsets.all(10.0),
          child: ListView(
            children: <Widget>[
              RaisedButton(
                onPressed: () {},
                child: Text("textColor文本的颜色，color背景颜色，highlightColor按钮按下的颜色"),
                textColor: Colors.white,
                color: AppColors.blue_normal,
                highlightColor: AppColors.blue_pressed,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("disabledTextColor禁用时文本颜色，disabledColor禁用时背景颜色"),
                disabledTextColor: Color(0xff999999),
                disabledColor: Color(0xffff0000),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("splashColor水波的颜色，disabledColor禁用时背景颜色"),
                splashColor: Color(0xffff0000),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("colorBrightness按钮主题高亮 Brightness.light"),
                colorBrightness: Brightness.light,
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("colorBrightness按钮主题高亮 Brightness.dark"),
                colorBrightness: Brightness.dark,
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child:
                      Text("elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                  elevation: 5.0,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child:
                      Text("elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                  highlightElevation: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20.0),
                child: RaisedButton(
                  onPressed: () {},
                  child:
                      Text("elevation按钮下面的阴影,highlightElevation高亮时候的阴影,disabledElevation按下的时候的阴影"),
                  disabledElevation: 5.0,
                ),
              ),
              RaisedButton(
                onPressed: () {},
                child: Text("onHighlightChanged 水波纹高亮变化回调,按下返回true,抬起返回false"),
                onHighlightChanged: (bool b) {
                  print(b);
                },
              ),
              RaisedButton(
                onPressed: () {
                  print("点击了");
                },
                child: Text("onPressed点击事件"),
              ),
            ],
          ),
        ));
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
