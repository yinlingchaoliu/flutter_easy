import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';

///@author: chentong
///2019-4-9
///视图层
class DefaultPage extends StatefulWidget {
  ///路由跳转
  static void pushDefaultPage(BuildContext context) {
    Navigator.push(
        context,
        new CupertinoPageRoute<void>(
            builder: (ctx) => new BlocProvider<DefaultBloc>(
                  child: new DefaultPage(),
                  bloc: new DefaultBloc(),
                )));
  }

  @override
  _DefaultPageState createState() => new _DefaultPageState();
}

///
/// 页面实现
///
class _DefaultPageState extends State<DefaultPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final DefaultBloc bloc = BlocProvider.of<DefaultBloc>(context);

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
class DefaultBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
