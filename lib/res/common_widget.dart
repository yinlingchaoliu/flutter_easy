import 'package:flutter/material.dart';
import 'package:flutter_easy/common/util/util_index.dart';

import 'res_index.dart';

///
///
/// 常用UI属性，便于快速统一
/// author: chentong
///
///
class CommonWidget {
  ///获得分割线
  static Widget getDivider() {
    return new Divider(
      height: 1,
      color: Colors.grey.shade600,
    );
  }

  ///设置默认statusbar
  static Widget getStatusBar({Color color = Colors.white}) {
    return new Container(height: 24.0, width: double.infinity, color: color);
  }

  ///获得登录按钮
  static Widget getLoginRaisedButton(
      {String text = '确认', @required VoidCallback onPressed}) {
    return new WidgetDecoration(new RaisedButton(

            ///onPressed不能为null
            onPressed: onPressed,
            color: AppColors.blue_normal,
            child: new Text(
              text,
              style: new TextStyle(color: Colors.white, fontSize: 18),
            ),

            ///设置圆角
            shape: new RoundedRectangleBorder(
                side: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(30)))))
        .sizedBox(width: double.infinity, height: 50)
        .build();
  }
}
