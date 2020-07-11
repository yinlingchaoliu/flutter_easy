import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;
import 'package:flutter/services.dart';
import 'package:flutter_easy/app/application.dart';
import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/page/welcome_page.dart';
import 'package:flutter_easy/res/Themes.dart';
import 'package:flutter_easy/res/localizations/localizations_delegate.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

///
/// flutter图片icon采用 fonticon
/// 为方便演示 涉及icon一律采用fonticon
///
/// png转fonticon链接
/// 'https://www.jianshu.com/p/e095774b385c'
///  https://www.iconfont.cn
///  https://www.cnblogs.com/hupo376787/p/10288199.html
///
///
void main() async {
  ///项目初始化点
  await App.init();
  debugPaintSizeEnabled = false; //打开视觉调试开关

  if (Platform.isAndroid) {
    // 以下两行 设置android状态栏为透明的沉浸。写在组件渲染之后，是为了在渲染后进行set赋值，覆盖状态栏，写在渲染之前MaterialApp组件会覆盖掉这个值。
    SystemUiOverlayStyle systemUiOverlayStyle =
        SystemUiOverlayStyle(statusBarColor: Colors.transparent);
    SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
  }

  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      ///国际化
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        AppLocalizationsDelegate.delegate,
      ],

      locale: Locale('zh', 'CN'),
//      locale: Locale('en', 'US'),
      supportedLocales: [
        const Locale('en', 'US'), // 美国英语
        const Locale('zh', 'CN'), // 中文简体
        //其它Locales
      ],

      title: "消费金融", //国际化不支持修改APP标题
      theme: defaultTargetPlatform == TargetPlatform.iOS
          ? Themes.kIOSTheme
          : Themes.kDefaultTheme,
      // 根据平台获取主题
      home: new WelcomePage(),
      onGenerateRoute: RouterManager.generator(), //路由工具
      debugShowCheckedModeBanner: true, // 去除右上角Debug标签
    );
  }
}
