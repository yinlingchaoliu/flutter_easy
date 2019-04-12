import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';

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
class RepayBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
