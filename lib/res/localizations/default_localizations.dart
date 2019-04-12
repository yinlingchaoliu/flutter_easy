import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_easy/res/localizations/language/string_base.dart';
import 'package:flutter_easy/res/localizations/language/string_en.dart';
import 'package:flutter_easy/res/localizations/language/string_zh.dart';

///自定义多语言实现
class AppLocalizations {
  final Locale locale;

  AppLocalizations(this.locale);

  ///根据不同 locale.languageCode 加载不同语言对应
  ///StringEn和StringZh都继承了StringBase
  static Map<String, StringBase> _localizedValues = {
    'en': new StringEn(),
    'zh': new StringZh(),
  };

  StringBase get currentLocalized {
    return _localizedValues[locale.languageCode];
  }

  ///通过 Localizations 加载当前的 AppLocalizations
  ///获取对应的 StringBase
  static AppLocalizations of(BuildContext context) {
    return Localizations.of(context, AppLocalizations);
  }

  static StringBase get(BuildContext context) {
    return AppLocalizations.of(context).currentLocalized;
  }

  StringBase getName(BuildContext context) {
    return AppLocalizations.of(context).currentLocalized;
  }

  ///  void test(BuildContext context){
  ///    String name =  AppLocalizations.get(context).app_name;
  ///  }
}
