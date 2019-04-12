import 'dart:ui';

import 'package:flutter_easy/redux/locale_state.dart';
import 'package:redux/redux.dart';

//final LocaleReducer = combineReducers<Locale>([
//  TypedReducer<Locale, RefreshLocaleAction>(_refresh),
//]);

//LocaleReducer(state,)
LocaleReducer(locale, action) {
  return combineReducers<Locale>([
    TypedReducer<Locale, RefreshLocaleAction>(_refresh),
  ]);
}

Locale _refresh(Locale locale, RefreshLocaleAction action) {
  locale = action.locale;
  return locale;
}

//action
class RefreshLocaleAction {
  final Locale locale;

  RefreshLocaleAction(this.locale);
}

Store<LocaleState> getStore() {
  return new Store<LocaleState>(appReducer,
      middleware: middleware,
      initialState: new LocaleState(locale: Locale('zh', 'CH')));
}

//发送事件
void dispatch() {
  Store store = getStore();
  store.dispatch(RefreshLocaleAction(Locale('en', 'US')));
}
