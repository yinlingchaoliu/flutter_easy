import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import 'base_bloc.dart';

///
///list列表
///author:chentong
///
abstract class SmartRefreshBloc extends PullToRefreshBloc {
  RefreshController refreshController;
  ScrollController scrollController;

  ///初始化
  void initState() {
    scrollController = new ScrollController();
    refreshController = new RefreshController();
  }

  void scrollTop() {
    scrollController.animateTo(0.0,
        duration: new Duration(microseconds: 1000), curve: ElasticInCurve());
  }

  void onRefreshCallBack(bool up) {
    if (up) {
      onRefresh();
    } else {
      onLoadMore();
    }
  }

  ///默认方法
  void onOffsetCallback(bool isUp, double offset) {
    // if you want change some widgets state ,you should rewrite the callback
    if (isUp) {
    } else {}
  }

  ///请求
  void refreshRequest({bool up = true}) {
    SchedulerBinding.instance.addPostFrameCallback((_) {
      refreshController.requestRefresh(up);
    });
  }

  ///完成
  void refreshCompleted() {
    refreshController.sendBack(true, RefreshStatus.completed);
  }

  ///空闲
  void refreshIdle() {
    refreshController.sendBack(false, RefreshStatus.idle);
  }

  ///失败
  void refreshFailed() {
    refreshController.sendBack(false, RefreshStatus.failed);
  }

  ///自定义头部
  Widget headerCreate(BuildContext context, RefreshStatus mode) {
    return new ClassicIndicator(mode: mode);
  }

  ///自定义脚部
  Widget footerCreate(BuildContext context, RefreshStatus mode) {
    return new ClassicIndicator(mode: mode);
  }

  @override
  void dispose() {}
}

///下拉刷新Bloc
abstract class PullToRefreshBloc extends BlocBase {
  ///加载数据
  Future getData({String labelId, int page});

  ///刷新
  Future onRefresh({String labelId});

  ///更多
  Future onLoadMore({String labelId, int page});
}
