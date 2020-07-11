import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';

///@author: chentong
///2019-4-9
///视图层
class TestPage extends StatefulWidget {
  ///路由跳转
  static void pushTestPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<TestBloc>(
                  child: new TestPage(),
                  bloc: new TestBloc(),
                )));
  }

  ///获得当前页面实例
  static StatefulWidget newInstance() {
    return new BlocProvider<TestBloc>(
      child: new TestPage(),
      bloc: new TestBloc(),
    );
  }

  @override
  _TestPageState createState() => new _TestPageState();
}

///
/// 页面实现
///
class _TestPageState extends State<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final TestBloc bloc = BlocProvider.of<TestBloc>(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('demo'),
        centerTitle: true,
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
class TestBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
