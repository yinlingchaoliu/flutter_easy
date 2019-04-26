import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/common.dart';
import 'package:flutter_easy/common/util/util_index.dart';
import 'package:flutter_easy/page/login_page.dart';
import 'package:flutter_easy/page/register_page.dart';
import 'package:flutter_easy/res/drawable.dart';

///@author: chentong
///2019-4-9
///视图层
class AccountPage extends StatefulWidget {
  ///路由跳转
  static void pushAccountPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<AccountBloc>(
                  child: new AccountPage(),
                  bloc: new AccountBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<AccountBloc>(
      child: new AccountPage(),
      bloc: new AccountBloc(),
    );
  }

  @override
  _AccountPageState createState() => new _AccountPageState();
}

///
/// 页面实现
///
class _AccountPageState extends State<AccountPage>
    with TickerProviderStateMixin {
  int currentIndex = 0;
  TabController tabController;

  @override
  void initState() {
    super.initState();
    tabController = new TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    final AccountBloc bloc = BlocProvider.of<AccountBloc>(context);

    tabController.addListener(() {
      setState(() {
        currentIndex = tabController.index;
      });
    });

    return new Scaffold(
        backgroundColor: Colors.white,
        body: new DefaultTabController(
            length: bloc.tabs.length,
            child: new Column(
              children: <Widget>[
                new WidgetDecoration(
                        Image.asset(AppIcons.ICON_LOGIN_TITLE, height: 40))
                    .padding(top: 70, bottom: 30)
                    .build(),
                new Container(
                  padding: CommonUtil.padding(left: 30, right: 30),
                  child: new Column(
                    children: <Widget>[
                      new Row(
                        children: <Widget>[
                          new WidgetDecoration(new Text("登录",
                                  style: new TextStyle(
                                      color: currentIndex == 0
                                          ? Colors.blue.shade700
                                          : Colors.grey.shade700,
                                      fontSize: 18)))
                              .align(alignment: Alignment.center)
                              .paddAll(all: 10)
                              .onTap(() {
                                setState(() {
                                  currentIndex = 0;
                                });
                                tabController.animateTo(0,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear);
                              })
                              .expanded()
                              .build(),
                          new WidgetDecoration(new Text("注册",
                                  style: new TextStyle(
                                      color: currentIndex == 1
                                          ? Colors.blue.shade700
                                          : Colors.grey.shade700,
                                      fontSize: 18)))
                              .align(alignment: Alignment.center)
                              .paddAll(all: 10)
                              .onTap(() {
                                setState(() {
                                  currentIndex = 1;
                                });
                                tabController.animateTo(1,
                                    duration: Duration(milliseconds: 100),
                                    curve: Curves.linear);
                              })
                              .expanded()
                              .build()
                        ],
                      ),
                      new Row(
                        children: <Widget>[
                          new WidgetDecoration(new Container(
                            color: Colors.blue.shade700,
                            height: 2,
                            width: double.infinity,
                          ))
                              .opacity(opacity: currentIndex == 0 ? 1 : 0)
                              .align()
                              .expanded()
                              .build(),
                          new WidgetDecoration(new Container(
                            color: Colors.blue.shade700,
                            height: 2,
                            width: double.infinity,
                          ))
                              .opacity(opacity: currentIndex == 1 ? 1 : 0)
                              .align()
                              .expanded()
                              .build(),
                        ],
                      ),
                      new Divider(
                        height: 1,
                        color: Colors.grey.shade600,
                      )
                    ],
                  ),
                ),
                new Expanded(
                  child: TabBarView(
                    children: bloc.tabviews,
                    controller: tabController,
                  ),
                ),
              ],
            )));
  }

  @override
  void dispose() {
    super.dispose();

    ///必须要及时清理 否则出现异常
    tabController.dispose();
  }
}

///
///逻辑层
///todo:此处逻辑建议迁移出去 分离开解耦
///
class AccountBloc extends BlocBase {
  List<Tab> tabs = <Tab>[Tab(text: "登录"), Tab(text: "注册")];

  List<Widget> tabviews = [LoginPage.newInstance(), RegisterPage.newInstance()];

  @override
  void initState() {}

  @override
  void dispose() {}
}
