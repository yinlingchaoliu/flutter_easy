import 'package:flutter/material.dart';
import 'package:flutter_easy/common/util/common.dart';

///widget装饰器
///
/// author:chentong
/// 层级调用改为链式调用，方便查看
/// 4/11/19
///
class WidgetDecoration {
  Widget _widget;

  WidgetDecoration(widget) {
    this._widget = widget;
  }

  Function _onTapFunc;
  Function _onDoubleTapFunc;
  Function _onLongPressFunc;

  ///add padding属性
  WidgetDecoration padding(
      {double left = 0.0,
      double top = 0.0,
      double right = 0.0,
      double bottom = 0.0}) {
    var padding =
        CommonUtil.padding(left: left, top: top, right: right, bottom: bottom);
    _widget = new Padding(padding: padding, child: _widget);
    return this;
  }

  ///增加padingall
  WidgetDecoration paddAll({double all = 0.0}) {
    var padding = CommonUtil.paddingAll(all);
    _widget = new Padding(padding: padding, child: _widget);
    return this;
  }

  ///增加align 当前布局相对位置
  ///FractionalOffset.centerRight
  WidgetDecoration align({AlignmentGeometry alignment = Alignment.center}) {
    _widget = new Align(alignment: alignment, child: _widget);
    return this;
  }

  ///填充布局
  WidgetDecoration expanded({int flex = 1}) {
    _widget = new Expanded(flex: flex, child: _widget);
    return this;
  }

  ///点击事件
  WidgetDecoration onClick({onTap, onDoubleTap, onLongPress}) {
    _widget = new GestureDetector(
      child: _widget,
      onTap: onTap ?? _onTapFunc,
      onDoubleTap: onDoubleTap ?? _onDoubleTapFunc,
      onLongPress: onLongPress ?? _onLongPressFunc,
    );
    return this;
  }

  ///添加点击事件
  WidgetDecoration onTap(Function func) {
    _onTapFunc = func;
    _widget = new GestureDetector(
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTapFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  ///双击
  WidgetDecoration onDoubleTap(Function func) {
    _onDoubleTapFunc = func;
    _widget = new GestureDetector(
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTapFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  ///长按
  WidgetDecoration onLongPress(Function func) {
    _onLongPressFunc = func;
    _widget = new GestureDetector(
      child: _widget,
      onTap: _onTapFunc,
      onDoubleTap: _onDoubleTapFunc,
      onLongPress: _onLongPressFunc,
    );
    return this;
  }

  Widget build() {
    return _widget;
  }
}
