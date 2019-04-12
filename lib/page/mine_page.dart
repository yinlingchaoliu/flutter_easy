import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/common.dart';
import 'package:flutter_easy/common/util/widget_decorator.dart';
import 'package:flutter_easy/res/drawable.dart';
import 'package:fluttertoast/fluttertoast.dart';

///@author: chentong
///2019-4-9
///视图层
class MinePage extends StatefulWidget {
  ///路由跳转
  static void pushMinePage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<MineBloc>(
                  child: new MinePage(),
                  bloc: new MineBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<MineBloc>(
      child: new MinePage(),
      bloc: new MineBloc(),
    );
  }

  @override
  _MinePageState createState() => new _MinePageState();
}

///
/// 页面实现
///
class _MinePageState extends State<MinePage>
    with AutomaticKeepAliveClientMixin {
  bool get wantKeepAlive => true; // 保持底部切换状态不变

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final MineBloc bloc = BlocProvider.of<MineBloc>(context);

    return new Scaffold(
        body: new ListView(
      children: <Widget>[
        new Container(
            decoration: CommonUtil.background(AppIcons.ICON_MINE_BG),
            width: CommonUtil.matchParent(),
            height: 141,
            child: new Column(
              children: <Widget>[
                new WidgetDecoration(
                        CommonUtil.getAssetIcon(AppIcons.ICON_TELE))
                    .padding(right: 17, top: 10)
                    .align(alignment: FractionalOffset.centerRight)
                    .onTap(() {
                  Fluttertoast.showToast(msg: "来电话了");
                }).build(),
                new Row(
                  children: <Widget>[
                    WidgetDecoration(Image.asset(
                      AppIcons.ICON_MINE_USERLOGO,
                      width: 50,
                      height: 50,
                    )).padding(left: 25).onTap(() {
                      Fluttertoast.showToast(msg: "用户");
                    }).build(),
                    WidgetDecoration(new Text("186****6749",
                            style:
                                TextStyle(fontSize: 19, color: Colors.white)))
                        .padding(left: 20)
                        .onTap(() {
                      Fluttertoast.showToast(msg: "6749");
                    }).build(),
                  ],
                ),
              ],
            )),
        new Container(
          child: new ListTile(
            leading: new Icon(
              Icons.attach_money,
              color: Colors.green[400],
            ),
            title: new Text("我的借款"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              Fluttertoast.showToast(msg: "我的借款");
            },
          ),
          margin: EdgeInsets.only(top: 10),
          color: Colors.white,
        ),
        new Container(
          child: new ListTile(
            leading: new Icon(
              Icons.credit_card,
              color: Colors.blue[400],
            ),
            title: new Text("我的银行卡"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              Fluttertoast.showToast(msg: "我的银行卡");
            },
          ),
          color: Colors.white,
          margin: EdgeInsets.only(top: 10),
        ),
        new Container(
          child: new ListTile(
            leading: new Icon(
              Icons.message,
              color: Colors.deepOrangeAccent[400],
            ),
            title: new Text("我的消息"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              Fluttertoast.showToast(msg: "我的消息");
            },
          ),
          color: Colors.white,
          margin: EdgeInsets.only(top: 10),
        ),
        new Container(
          child: new ListTile(
            leading: new Icon(
              Icons.settings,
              color: Colors.orange[400],
            ),
            title: new Text("我的设置"),
            trailing: new Icon(Icons.chevron_right),
            onTap: () {
              Fluttertoast.showToast(msg: "我的设置");
            },
          ),
          color: Colors.white,
          margin: EdgeInsets.only(top: 10),
        )
      ],
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
class MineBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
