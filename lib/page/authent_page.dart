import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/res/common_widget.dart';
import 'package:flutter_easy/res/drawable.dart';

///@author: chentong
///2019-4-9
///视图层
class AuthentPage extends StatefulWidget {
  ///路由跳转
  static void pushAuthentPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<AuthentBloc>(
                  child: new AuthentPage(),
                  bloc: new AuthentBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<AuthentBloc>(
      child: new AuthentPage(),
      bloc: new AuthentBloc(),
    );
  }

  @override
  _AuthentPageState createState() => new _AuthentPageState();
}

///
/// 页面实现
///
class _AuthentPageState extends State<AuthentPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final AuthentBloc bloc = BlocProvider.of<AuthentBloc>(context);

    return new Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text('认证中心'),
        centerTitle: true,
      ),
      body: new Column(
        children: <Widget>[
          new Container(
            height: 100,
            width: double.infinity,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Column(children: <Widget>[
                  new WidgetDecoration(Text('身份证人物面',
                          style: TextStyle(color: Colors.black, fontSize: 16)))
                      .align(alignment: Alignment.centerLeft)
                      .padding(top: 15)
                      .build(),
                  new WidgetDecoration(Text('从正面拍摄不要倾斜',
                          style: TextStyle(
                              color: Color(0x77000000), fontSize: 14)))
                      .align(alignment: Alignment.centerLeft)
                      .padding(top: 10, left: 15)
                      .build(),
                ]),
                new WidgetDecoration(Image.asset(AppIcons.ICON_AUTHENT_IDUP,
                        width: 110, height: 70))
                    .align(alignment: Alignment.centerRight)
                    .expanded()
                    .build(),
              ],
            ),
          ),
          new Container(
            width: double.infinity,
            height: 1,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Color(0xffD1D1D1),
          ),
          new Container(
            height: 100,
            width: double.infinity,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Column(children: <Widget>[
                  new WidgetDecoration(Text('身份证国徽面',
                          style: TextStyle(color: Colors.black, fontSize: 16)))
                      .padding(top: 15, left: 15)
                      .align(alignment: Alignment.centerLeft)
                      .build(),
                  new WidgetDecoration(Text('从正面拍摄不要倾斜',
                          style: TextStyle(
                              color: Color(0x77000000), fontSize: 14)))
                      .padding(top: 10, left: 15)
                      .align(alignment: Alignment.centerLeft)
                      .build(),
                ]),
                new WidgetDecoration(Image.asset(AppIcons.ICON_AUTHENT_IDUP,
                        width: 110, height: 70))
                    .align(alignment: Alignment.centerRight)
                    .expanded()
                    .build(),
              ],
            ),
          ),
          new Container(
            width: double.infinity,
            height: 1,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Color(0xffD1D1D1),
          ),
          new Container(
            height: 100,
            width: double.infinity,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Colors.white,
            child: new Row(
              children: <Widget>[
                new Column(children: <Widget>[
                  new WidgetDecoration(Text('面部照片',
                          style: TextStyle(color: Colors.black, fontSize: 16)))
                      .padding(top: 15, left: 15)
                      .build(),
                  new WidgetDecoration(Text('添加人脸正面照\n请勿佩戴粗框眼镜',
                          style: TextStyle(
                              color: Color(0x77000000), fontSize: 14)))
                      .padding(top: 10, left: 15)
                      .build(),
                ]),
                new WidgetDecoration(Image.asset(AppIcons.ICON_AUTHENT_IDUP,
                        width: 110, height: 70))
                    .align(alignment: Alignment.centerRight)
                    .expanded()
                    .build(),
              ],
            ),
          ),
          new Container(
            width: double.infinity,
            height: 1,
            margin: CommonUtil.padding(left: 15, right: 15),
            color: Color(0xffD1D1D1),
          ),
          new Expanded(child: new Container()),
          new WidgetDecoration(CommonWidget.getLoginRaisedButton(
                  text: '下一步', onPressed: () {}))
              .sizedBox(height: 50, width: double.infinity)
              .padding(left: 15, right: 15, bottom: 15)
              .build(),
        ],
      ),
    );
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
class AuthentBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
