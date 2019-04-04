import 'package:flutter/material.dart';
import 'package:flutter_easy/app/application.dart';
import 'package:flutter_easy/test/net_test.dart';

void main() async {
  ///项目初始化点
  await App.init();
  runApp(new MyApp());
}

//程序测试点
void test() async {
  TestNet.testLogin();
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Demo',
      theme: new ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
        // counter didn't reset back to zero; the application is not restarted.
        primarySwatch: Colors.blue,
      ),
//      home: new MyHomePage(title: 'Flutter 你怎么这么优秀'),
      home: new MyHomePage(
        title: '我怎么这么好看',
      ),
//      home: ColumnSample(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      test();
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return new Scaffold(
      appBar: new AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: new Text(widget.title),
      ),
      body: new Center(
        // Center is a layout widget. It takes a single child and positions it
        // in the middle of the parent.
        child: new Column(
          // Column is also layout widget. It takes a list of children and
          // arranges them vertically. By default, it sizes itself to fit its
          // children horizontally, and tries to be as tall as its parent.
          //
          // Invoke "debug paint" (press "p" in the console where you ran
          // "flutter run", or select "Toggle Debug Paint" from the Flutter tool
          // window in IntelliJ) to see the wireframe for each widget.
          //
          // Column has various properties to control how it sizes itself and
          // how it positions its children. Here we use mainAxisAlignment to
          // center the children vertically; the main axis here is the vertical
          // axis because Columns are vertical (the cross axis would be
          // horizontal).
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              'I click one time ,you click my heart:',
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
      ), // This trailing comma makes auto-formatting nicer for build methods.
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
