import 'package:fluro/fluro.dart';

import 'router_handler.dart';

///路由表
///chentong
///
class Routes {
  static const String root = "/";

  ///404 未找到页面
  static const String error_404 = "/category/error/404";
  static const String defalut_page = "/category/defalut_page";

  ///首页
  static const String home_page = "/home";

  static const String welcome_page = "/welcome";
  static const String login_page = "/login_page";
  static const String account_page = "/account_page";

  static void configureRoutes(Router router) {
    router.notFoundHandler = widgetNotFoundHandler;
    router.define(error_404, handler: widgetNotFoundHandler);
    router.define(defalut_page, handler: widgetDefaultPageHandler);
    router.define(welcome_page, handler: welcomePageHandler);
    router.define(home_page, handler: homeHandler);
    router.define(login_page, handler: loginHandler);
    router.define(account_page, handler: accountHandler);
  }
}
