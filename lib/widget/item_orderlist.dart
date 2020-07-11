import 'package:flutter/material.dart';
import 'package:flutter_easy/common/util/util_index.dart';

///author:chentong
///date:4/10/19
class OrderListItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //todo 直接布局内容，不要Scaffold 对 listview有影响
    return new Column(
      children: <Widget>[
        new WidgetDecoration(
                Text('借款金额', style: TextStyle(color: Color(0xff121C32))))
            .padding(left: 19, top: 12)
            .align(alignment: Alignment.centerLeft)
            .build(),
        new WidgetDecoration(Text('1000',
                style: TextStyle(color: Color(0xff5783E8), fontSize: 17)))
            .padding(left: 19, top: 5)
            .align(alignment: Alignment.centerLeft)
            .build(),
        new Row(
          children: <Widget>[
            new WidgetDecoration(
                    Text('已还', style: TextStyle(color: Color(0xff121C32))))
                .padding(left: 19, top: 12, bottom: 5)
                .align(alignment: Alignment.centerLeft)
                .expanded()
                .build(),
            new WidgetDecoration(
                    Text('期限', style: TextStyle(color: Color(0xff121C32))))
                .padding(right: 13, top: 12, bottom: 5)
                .align(alignment: Alignment.centerRight)
                .expanded()
                .build(),
          ],
        ),
        new Container(
          width: double.infinity,
          height: 1,
          color: Color(0xffD1D1D1),
        )
      ],
    );
  }
}
