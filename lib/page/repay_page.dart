import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/bloc/pulltofresh_bloc.dart';
import 'package:flutter_easy/widget/item_orderlist.dart';
import 'package:flutter_easy/widget/item_orderlist_header.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

///@author: chentong
///2019-4-9
///视图层
class RepayPage extends StatefulWidget {
  ///路由跳转
  static void pushRepayPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<RepayBloc>(
                  child: new RepayPage(),
                  bloc: new RepayBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<RepayBloc>(
      child: new RepayPage(),
      bloc: new RepayBloc(),
    );
  }

  @override
  _RepayPageState createState() => new _RepayPageState();
}

///
/// 页面实现
///
class _RepayPageState extends State<RepayPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final RepayBloc bloc = BlocProvider.of<RepayBloc>(context);

    return new Scaffold(
        body: new RefreshIndicator(
            child: new SmartRefresher(
                controller: bloc.refreshController,
                enablePullDown: true,
                enablePullUp: false,
                enableOverScroll: false,
                headerBuilder: bloc.headerCreate,
                footerBuilder: bloc.footerCreate,
                onRefresh: (up) {
                  if (up) {
                    Fluttertoast.showToast(msg: "上拉刷新");

                    ///延时2秒
                    new Future.delayed(const Duration(milliseconds: 1000))
                        .then((val) {
                      bloc.onRefresh().whenComplete(() {
                        setState(() {
                          bloc.refreshCompleted();
                        });
                      }).catchError(() {
                        setState(() {
                          bloc.refreshFailed();
                        });
                      });
                    });
                  } else {
                    Fluttertoast.showToast(msg: "下拉加载");

                    ///延时2秒
                    new Future.delayed(const Duration(milliseconds: 1000))
                        .then((val) {
                      bloc.onLoadMore().whenComplete(() {
                        setState(() {
                          bloc.refreshIdle();
                        });
                      }).catchError(() {
                        setState(() {
                          bloc.refreshFailed();
                        });
                      });
                    });
                  }
                },
                onOffsetChange: bloc.onOffsetCallback,
                child: new ListView.builder(
                  reverse: true,
                  controller: bloc.scrollController,
                  //              itemExtent: 100.0,
                  itemCount: bloc.data.length,
                  itemBuilder: (context, index) {
                    return bloc.buildImage(context, index);
                  },
                )),
            onRefresh: () {
              Fluttertoast.showToast(msg: "刷新账单");
              return new Future.delayed(const Duration(milliseconds: 1000));
            }));
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
class RepayBloc extends SmartRefreshBloc {
  List<Widget> data = [
    OrderListHeadItemWidget(),
    OrderListItemWidget(),
    OrderListItemWidget(),
    OrderListItemWidget(),
    OrderListItemWidget(),
    OrderListItemWidget(),
    OrderListItemWidget(),
  ];

  Widget buildImage(context, index) {
    return data[index];
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Future onRefresh({String labelId}) async {
    data.clear();
    data.add(getItemWidget('Data up'));
    Fluttertoast.showToast(msg: "上拉刷新");
    return data;
  }

  @override
  Future onLoadMore({String labelId, int page}) async {
    data.add(getItemWidget('Data down'));
    Fluttertoast.showToast(msg: "下拉加载");
    return data;
  }

  Widget getItemWidget(String text) {
    return new Card(
      margin:
          new EdgeInsets.only(left: 10.0, right: 10.0, top: 5.0, bottom: 5.0),
      child: new Center(
        child: new Text(text),
      ),
    );
  }

  @override
  Future getData({String labelId, int page}) {
    // TODO: implement getData
    return null;
  }
}
