import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/arouter/404.dart';
import 'package:flutter_easy/page/account_page.dart';
import 'package:flutter_easy/page/default_page.dart';
import 'package:flutter_easy/page/home_page.dart';
import 'package:flutter_easy/page/login_page.dart';
import 'package:flutter_easy/page/welcome_page.dart';

// app的首页
var homeHandler = new Handler(
  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
    return HomePage.newInstance();
  },
);

///404 not found
var widgetNotFoundHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WidgetNotFound();
});

///推荐这种写法 类似于MVP
var widgetDefaultPageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DefaultPage.newInstance();
});

///welcomepage
var welcomePageHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return new WelcomePage();
});

///loginpage
var loginHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage.newInstance();
});

///账户页面
var accountHandler = new Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AccountPage.newInstance();
});

///for test
//var webViewPageHand = new Handler(
//    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//      String title = params['title']?.first;
//      String url = params['url']?.first;
//      return new WebViewPage(url, title);
//    });

//var categoryHandler = new Handler(
//  handlerFunc: (BuildContext context, Map<String, List<String>> params) {
//    String name = params["type"]?.first;
//
//    return new CategoryHome(name);
//  },
//);
