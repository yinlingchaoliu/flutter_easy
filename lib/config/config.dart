///
/// 业务常量
/// sp存储
///
class Constants {
  static const PAGE_SIZE = 20;
  static const DEBUG = true;
  static const USE_NATIVE_WEBVIEW = true;

  /// //////////////////////////////////////常量////////////////////////////////////// ///
  static const TOKEN_KEY = "token";
  static const USER_NAME_KEY = "user-name";
  static const PW_KEY = "user-pw";
  static const USER_BASIC_CODE = "user-basic-code";
  static const USER_INFO = "user-info";
  static const LANGUAGE_SELECT = "language-select";
  static const LANGUAGE_SELECT_NAME = "language-select-name";
  static const REFRESH_LANGUAGE = "refreshLanguageApp";
  static const THEME_COLOR = "theme-color";
  static const LOCALE = "locale";

  ///常量
  static const String SP_REGISTRATION_ID = "registrationId";
  static const String SP_IS_INSTALLED = "isInstalled";
  static const String SP_USE_INFO = "user";

  //表示是否登录了
  static const String ISLOGIN_KEY = "islogin_key";

  static const String TI_XIAN_KEY = "ti_xian_key";

  //标题传递
  static const String TITLE_KEY = "title_key";

  //webview加载地址的key
  static const String WEBVIEWPATH_KEY = "webview_key";
  //登录返回的信息
  static const String USERID_KEY = "userId";

  static const String TELE_KEY = "telephone";
  //appkey,请求接口时使用
  static const String APPKEY = "1234";
  //保存密码的key
  static const String PWD_KEY = "password";
  //倒计时时间
  static const int TIMECURRENT = 60000;
  static const int FLASH_TIMECURRENT = 4000;

  static const String BUGLY_APPID = "6e02e8f18a";

  //请求最大次数
  static const int REQUEST_MAXRETRIES = 2;
  //请求间隔
  static const int REQUEST_RETRYDELAYSECOND = 2;
  //分页条数
  static const int PAGE_LIMIT = 10;

  //认证页面来源
  static const int AUTHEN_FROM_APPLY = 1;

  //跳转到实名认证的标记
  static const String AUTHEN_FROM_KEY = "authen_from_key";
  //来自绑卡判断
  static const int AUTHEN_FROM_BINDCAK = 0;

  //个人信息界面的状态传值,0表示从用户认证界面进来，1表示从用户头像进来
  static const String USERINFOSTATE_KEY = "userinfostate_key";
  static const String IS_HAVE_UNREAD_MESSAGE = "IS_HAVE_UNREAD_MESSAGE";
  static const int USERINFO_FROMAUTHEN_KEY = 0;
  static const int USERINFO_FROMMINE_KEY = 1;

  //绑定音速卡标识
  static const String BIND_NORMAL_CARD_FLAG = "20";
  //绑定商城卡标识
  static const String BIND_MALL_CARD_FLAG = "30";

  //显示用户默认绑卡信息
  static const int SHOW_DEFAULT_BIND_CARD_INFO = -1;
  //隐藏用户默认绑卡信息
  static const int HIDE_DEFAULT_BIND_CARD_INFO = 1;

  //绑卡不为空错误码
  static const int BIND_ERROR_ORDER_NO_EMPTY_CODE = 10000;

  //borrowId
  static const String BORROWID_KEY = "borrowId";
  static const String INTENT_FLAG = "INTENT_FLAG";

  //存管用户标识
  static const String DEPOSITORY_USER = "10";
  //非存管用户标识
  static const String UNDEPOSITORY_USER = "20";
}
