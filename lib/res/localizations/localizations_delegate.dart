import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easy/res/localizations/default_localizations.dart';

/// 多语言代理
/// Created by guoshuyu
/// Date: 2018-08-15
class AppLocalizationsDelegate extends LocalizationsDelegate<AppLocalizations> {
  AppLocalizationsDelegate();

  @override
  bool isSupported(Locale locale) {
    ///支持中文和英语
    return ['en', 'zh'].contains(locale.languageCode);
  }

  ///根据locale，创建一个对象用于提供当前locale下的文本显示
  @override
  Future<AppLocalizations> load(Locale locale) {
    return new SynchronousFuture<AppLocalizations>(
        new AppLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<AppLocalizations> old) {
    return false;
  }

  ///全局静态的代理
  static AppLocalizationsDelegate delegate = new AppLocalizationsDelegate();
}
