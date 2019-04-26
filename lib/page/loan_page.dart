import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/common/bloc/base_bloc.dart';
import 'package:flutter_easy/common/util/widget_decorator.dart';
import 'package:flutter_easy/res/drawable.dart';

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
class _LoanPageState extends State<LoanPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final LoanBloc bloc = BlocProvider.of<LoanBloc>(context);

    return new Scaffold(
      appBar: new AppBar(
        title: new Text('demo'),
        centerTitle: true,
      ),
      body: new WidgetDecoration(Image.asset(
        AppIcons.ICON_MINE_BG,
        fit: BoxFit.fill,
      ))
          .sizedBox(width: 200, height: 200)
          .clipRRect(borderRadius: BorderRadius.all(Radius.circular(30.0)))
          .center()
          .build(),
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
class LoanBloc extends BlocBase {
  @override
  void initState() {}

  @override
  void dispose() {}
}
