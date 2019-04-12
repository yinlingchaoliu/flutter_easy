import 'package:flutter/material.dart';
import 'package:flutter_easy/redux/locale_redux.dart';
import 'package:redux/redux.dart';

/**
 * Redux全局State
 * Created by guoshuyu
 * Date: 2018-07-16
 */

///全局Redux store 的对象，保存State数据
class LocaleState {
  ///语言
  Locale locale;

  ///当前手机平台默认语言
  Locale platformLocale;

  ///构造方法
  LocaleState({this.locale});
}

///创建 Reducer
///源码中 Reducer 是一个方法 typedef State Reducer<State>(State state, dynamic action);
///我们自定义了 appReducer 用于创建 store
LocaleState appReducer(LocaleState state, action) {
  return LocaleState(
    ///通过 LocaleReducer 将 LocaleState 内的 locale 和 action 关联在一起
    locale: LocaleReducer(state.locale, action),
  );
}

final List<Middleware<LocaleState>> middleware = [];
