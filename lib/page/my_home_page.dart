import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easy/app/application.dart';
import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/arouter/routers.dart';
import 'package:flutter_easy/config/appbar.dart';
import 'package:flutter_easy/res/localizations/default_localizations.dart';
import 'package:flutter_easy/test/net_test.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  @override
  void initState() {
    super.initState();
    print("state_initState");
  }

  @override
  void didChangeDependencies() {
    print("state_didChangeDependencies");
  }

  @override
  void didUpdateWidget(MyHomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
    print("state_didUpdateWidget");
  }

  @override
  void deactivate() {
    super.deactivate();
    App.rehotfix();
    print("state_deactivate");
  }

  @override
  void reassemble() {
    super.reassemble();
    print("state_reassemble");
  }

  @override
  void dispose() {
    super.dispose();
    print("state_dispose");
  }

  void _incrementCounter() {
    setState(() {
      _counter++;
      TestNet.testLogin();

      ///      DefaultPage.pushDefaultPage(context);
//      RouterManager.navigateTo(context, Routes.error_404,
//          transition: TransitionType.inFromRight);
      RouterManager.navigateTo(context, Routes.defalut_page,
          transition: TransitionType.inFromRight);
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar:
          AppBars.getAppBar("首页", AppLocalizations.get(context).app_message),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'Flutter I click one time ,you click my heart:',
            ),
            new Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: new Icon(Icons.add),
      ),
    );
  }
}

class ColumnSample extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('RowSample'),
      ),
      body: new Container(
        color: Colors.pinkAccent,
        child: buildGravityColumns(),
      ),
    );
  }

  //row columns

  Widget buildColumns() {
    return new Row(
      children: <Widget>[
        new Icon(Icons.info),
        new Icon(Icons.map),
        new Icon(Icons.email)
      ]
      // warp_content
      ,
      mainAxisSize: MainAxisSize.max,
      //权重gravity
      crossAxisAlignment: CrossAxisAlignment.center,
    );
  }

  Widget buildGravityColumns() {
    return new Row(
        //大小
        mainAxisSize: MainAxisSize.max,
        //对齐效果
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        //权重
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          new Icon(Icons.info),
          new Icon(
            Icons.map,
            size: 80.0,
          ),
          new Icon(Icons.email)
        ]);
  }
}

//1、MainAxisAlignment.start，将子控件放在主轴的起始位置。
//2、MainAxisAlignment.end，将子控件放在主轴末尾。
//3、MainAxisAlignment.center，将子控件放在主轴中间位置。
// 将主轴方向上的空白区域等分，使得子控件之间的空白区域相等，
// 两端的子控件都靠近首尾，没有间隙。
//4、MainAxisAlignment.spaceBetween

// 将主轴方向上的空白区域等分，使得子控件之间的空白区域相等，
// 两端的子控件都靠近首尾，首尾子控件的空白区域为1/2。
//5、MainAxisAlignment.spaceAround

// 将主轴方向上的空白区域等分，使得子控件之间的空白区域相等，包括首尾。
//6、MainAxisAlignment.spaceEvenly
