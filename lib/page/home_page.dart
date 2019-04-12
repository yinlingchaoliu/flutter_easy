import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/common.dart';
import 'package:flutter_easy/page/repay_page.dart';
import 'package:flutter_easy/res/drawable.dart';

import 'loan_page.dart';
import 'mine_page.dart';

///@author: chentong
///2019-4-9
///视图层
class HomePage extends StatefulWidget {
  ///路由跳转
  static void pushHomePage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<HomeBloc>(
                  child: new HomePage(),
                  bloc: new HomeBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<HomeBloc>(
      child: new HomePage(),
      bloc: new HomeBloc(),
    );
  }

  @override
  _HomePageState createState() => new _HomePageState();
}

///
/// 页面实现
///
class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final HomeBloc bloc = BlocProvider.of<HomeBloc>(context);

    return Scaffold(
      body: PageView(
        controller: bloc._controller,
        children: bloc.getPage(),
        physics: NeverScrollableScrollPhysics(), // 进制滑动切换
      ),
      bottomNavigationBar: BottomNavigationBar(
        //底部导航点击事件
        currentIndex: bloc._currentIndex,
        onTap: (index) {
//          homebloc._controller.animateToPage(index,
//              duration: Duration(milliseconds: 500),
//              curve: Curves.fastOutSlowIn); // 动画效果 切换
          bloc._controller.jumpToPage(index); // 无动画效果切换
          setState(() {
            bloc._currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        //fixedColor: Colors.white,
        items: bloc.getBarItemList(),
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
class HomeBloc extends BlocBase {
  //当前的index
  int _currentIndex = 0; // 保持底部切换状态不变

  var _controller = PageController(
    initialPage: 0, // 底部 初始化页面 和状态
  );

  List<StatefulWidget> _pages = [
    LoanPage.newInstance(),
    RepayPage.newInstance(),
    MinePage.newInstance()
  ];

  List<StatefulWidget> getPage() {
    return _pages;
  }

  List<BottomNavigationBarItem> _items = [
    getBarItem("借款", AppIcons.ICON_HOME, AppIcons.ICON_HOME_PRE),
    getBarItem("账单", AppIcons.ICON_ORDER, AppIcons.ICON_ORDER_PRE),
    getBarItem("我的", AppIcons.ICON_MINE, AppIcons.ICON_MINE_PRE),
  ];

  List<BottomNavigationBarItem> getBarItemList() {
    return _items;
  }

  static getBarItem(String title, String icon, String activeIcon) {
    return new BottomNavigationBarItem(
      activeIcon: CommonUtil.getAssetIcon(activeIcon),
      icon: CommonUtil.getAssetIcon(icon),
      title: new Text(title, style: TextStyle(color: Colors.black)),
    );
  }

  @override
  void initState() {}

  @override
  void dispose() {
    _controller.dispose();
  }
}
