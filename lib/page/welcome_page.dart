import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/arouter/router_manager.dart';
import 'package:flutter_easy/arouter/routers.dart';
import 'package:flutter_easy/common/util/sputil.dart';
import 'package:flutter_easy/config/config.dart';
import 'package:flutter_easy/res/drawable.dart';

///欢迎页面
class WelcomePage extends StatefulWidget {
  @override
  _WelcomePageState createState() => new _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  bool hadInit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    ///防止多次进入
    new Future.delayed(const Duration(seconds: 3), () {
      String token = SpUtil.get(Constants.TOKEN_KEY, null);
      if (token == null || token.isEmpty) {
        RouterManager.navigateTo(context, Routes.home_page,
            transition: TransitionType.inFromRight);
      } else {
        RouterManager.navigateTo(context, Routes.home_page,
            transition: TransitionType.inFromRight);
      }
      return true;
    });
  }

  @override
  void didUpdateWidget(WelcomePage oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(BuildContext context) {
    return new Image.asset(AppIcons.DEFAULT_FLASH_ICON);
  }

  @override
  void dispose() {
    super.dispose();
  }
}
