import 'package:fluro/fluro.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/arouter/routers.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/res/res_index.dart';
import 'package:fluttertoast/fluttertoast.dart';

///@author: chentong
///2019-4-9
///视图层
class LoanPage extends StatefulWidget {
  ///路由跳转
  static void pushLoanPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<LoanBloc>(
                  child: new LoanPage(),
                  bloc: new LoanBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<LoanBloc>(
      child: new LoanPage(),
      bloc: new LoanBloc(),
    );
  }

  @override
  _LoanPageState createState() => new _LoanPageState();
}

///
/// 页面实现
///
class _LoanPageState extends State<LoanPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoanBloc bloc = BlocProvider.of<LoanBloc>(context);

    return new Scaffold(
        body: new RefreshIndicator(
            //      color: Colors.blue,
            onRefresh: () {
              Fluttertoast.showToast(msg: "刷新");
              return new Future.delayed(const Duration(milliseconds: 1000));
            },
            child: new ListView(
              padding: CommonUtil.paddingAll(0),
              children: <Widget>[
                new WidgetDecoration(Image.asset(AppIcons.ICON_BANNER))
                    .fittedBox(fit: BoxFit.fill)
                    .sizedBox(width: double.infinity, height: 200)
                    .build(),
                new Container(
                  margin: CommonUtil.padding(top: 50, left: 20, right: 20),
                  height: 200,
                  child: Card(
                      color: Colors.white,
                      elevation: 4,
                      shape: new RoundedRectangleBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4))),
                      child: new Stack(
                        children: <Widget>[
                          new Column(
                            children: <Widget>[
                              new WidgetDecoration(new Text(
                                "购易花",
                                style: new TextStyle(
                                    fontSize: 17,
                                    color: Color(0xff121c32),
                                    fontWeight: FontWeight.normal),
                              ))
                                  .align(alignment: Alignment.centerLeft)
                                  .padding(left: 24, top: 13)
                                  .build(),
                              new Container(
                                margin: CommonUtil.padding(
                                    top: 10, left: 24, bottom: 10),
                                child: new Row(
                                  children: <Widget>[
                                    new WidgetDecoration(new Text(
                                      "超低利率",
                                      style: new TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff88909f),
                                          fontWeight: FontWeight.normal),
                                    )).sizedBox(height: 19).build(),
                                    new WidgetDecoration(new Text(
                                      "极速审批",
                                      style: new TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff88909f),
                                          fontWeight: FontWeight.normal),
                                    ))
                                        .sizedBox(height: 19)
                                        .padding(left: 24)
                                        .build(),
                                    new WidgetDecoration(new Text(
                                      "复借秒速到账",
                                      style: new TextStyle(
                                          fontSize: 13,
                                          color: Color(0xff88909f),
                                          fontWeight: FontWeight.normal),
                                    ))
                                        .sizedBox(height: 19)
                                        .padding(left: 24)
                                        .build(),
                                  ],
                                ),
                              ),
                              new Container(
                                height: 1,
                                width: double.infinity,
                                color: Color(0xffD1D1D1),
                                margin: CommonUtil.padding(left: 25, right: 25),
                              ),
                              new WidgetDecoration(new Text(
                                "借款金额（元）",
                                style: new TextStyle(
                                    fontSize: 15,
                                    color: Color(0xff121c32),
                                    fontWeight: FontWeight.normal),
                              ))
                                  .align(alignment: Alignment.centerLeft)
                                  .padding(left: 24, top: 13)
                                  .build(),
                              new WidgetDecoration(new Text(
                                "1000",
                                style: new TextStyle(
                                    fontSize: 30,
                                    color: Color(0xff5783e8),
                                    fontWeight: FontWeight.normal),
                                maxLines: 7,
                              ))
                                  .align(alignment: Alignment.centerLeft)
                                  .padding(left: 24, top: 5)
                                  .build(),
                              new WidgetDecoration(new Text(
                                "借款期限 14 (天）",
                                style: new TextStyle(
                                    fontSize: 14,
                                    color: Color(0xff88909f),
                                    fontWeight: FontWeight.normal),
                              ))
                                  .align(alignment: Alignment.centerLeft)
                                  .padding(left: 24, top: 5)
                                  .build(),
                            ],
                          ),
                          new WidgetDecoration(new RaisedButton(

                                  ///onPressed不能为null
                                  onPressed: () {
                                    RouterManager.navigateTo(
                                        context, Routes.authent_page,
                                        transition: TransitionType.inFromRight);
                                  },
                                  color: AppColors.blue_normal,
                                  child: new Text("立即借款",
                                      style: new TextStyle(
                                          color: Colors.white, fontSize: 16)),

                                  ///设置圆角
                                  shape: new RoundedRectangleBorder(
                                      side: BorderSide.none,
                                      borderRadius:
                                          CommonUtil.borderRadiusAll(45.0))))
                              .sizedBox(height: 40, width: 113)
                              .align(alignment: Alignment.bottomRight)
                              .padding(bottom: 44, right: 20)
                              .build(),
                        ],
                      )),
                ),
                new Container(
                  margin: CommonUtil.padding(top: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Image.asset(AppIcons.ICON_HOME_BUTTOM_LEFT),
                      Container(
                        margin: CommonUtil.padding(left: 10, right: 10),
                        child: Text(
                          "购易花·借款新姿势",
                          style: new TextStyle(
                              color: Color(0xff121c32), fontSize: 17),
                        ),
                      ),
                      Image.asset(AppIcons.ICON_HOME_BUTTOM_LEFT),
                    ],
                  ),
                ),
                new Container(
                  margin: CommonUtil.padding(top: 20, bottom: 15),
                  child: Row(
//                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      new WidgetDecoration(new Column(
                        children: <Widget>[
                          Image.asset(
                            AppIcons.ICON_TAG1,
                            width: 35,
                            height: 35,
                          ),
                          WidgetDecoration(Text(
                            "费率透明",
                            style: TextStyle(color: Color(0xff787f8f)),
                          )).padding(top: 10).build()
                        ],
                      )).align().expanded().build(),
                      new WidgetDecoration(new Column(
                        children: <Widget>[
                          Image.asset(
                            AppIcons.ICON_TAG2,
                            width: 35,
                            height: 35,
                          ),
                          WidgetDecoration(Text(
                            "费率透明",
                            style: TextStyle(color: Color(0xff787f8f)),
                          )).padding(top: 10).build()
                        ],
                      )).align().expanded().build(),
                      new WidgetDecoration(new Column(
                        children: <Widget>[
                          Image.asset(
                            AppIcons.ICON_TAG3,
                            width: 35,
                            height: 35,
                          ),
                          WidgetDecoration(Text(
                            "费率透明",
                            style: TextStyle(color: Color(0xff787f8f)),
                          )).padding(top: 10).build()
                        ],
                      )).align().expanded().build(),
                    ],
                  ),
                )
              ],
            )));
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
class LoanBloc extends BlocBase {
  @override
  void dispose() {
    // TODO: implement dispose
  }

  @override
  void initState() {
    // TODO: implement initState
  }
}
