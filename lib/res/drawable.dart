import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppIcons {
  static const String FONT_FAMILY = 'wxcIconFont';

  static const String DEFAULT_WELCOME_ICON = 'static/images/welcome.png';

  static const String DEFAULT_FLASH_ICON = 'static/images/flash_icon.png';
  static const String DEFAULT_USER_ICON = 'static/images/logo.png';
  static const String DEFAULT_IMAGE = 'static/images/default_img.png';
  static const String DEFAULT_BANNER_ICON = 'static/images/banner.png';

  static const String ICON_HOME = 'static/images/ic_home.png';
  static const String ICON_HOME_PRE = 'static/images/ic_home_pre.png';

  static const String ICON_ORDER = 'static/images/ic_order.png';
  static const String ICON_ORDER_PRE = 'static/images/ic_order_pre.png';

  static const String ICON_MINE = 'static/images/ic_mine.png';
  static const String ICON_MINE_PRE = 'static/images/ic_mine_pre.png';

  static const String ICON_MINE_BG = 'static/images/ic_minebg.png';
  static const String ICON_MINE_USERLOGO = 'static/images/ic_mine_userlogo.png';
  static const String ICON_TELE = 'static/images/ic_tele.png';
}

class AppIconData {
  static final ICON_HOME = ImageIcon(new AssetImage(AppIcons.ICON_HOME));
  static final ICON_HOME_PRE =
      ImageIcon(new AssetImage(AppIcons.ICON_HOME_PRE));
}
