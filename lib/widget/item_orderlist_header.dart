import 'package:flutter/material.dart';
import 'package:flutter_easy/common/util/util_index.dart';

///author:chentong
///date:4/10/19
class OrderListHeadItemWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(
        children: <Widget>[
          new WidgetDecoration(
            Text('应还金额（元）', style: TextStyle(fontSize: 15)),
          ).padding(top: 15).align().build(),
          new WidgetDecoration(
            Text('1000',
                style: TextStyle(fontSize: 30, color: Color(0xff121C32))),
          ).padding(top: 12).align().build(),
          new Container(
            margin: CommonUtil.padding(top: 11, left: 40, right: 40),
            height: 1,
            color: Color(0xffD1D1D1),
          ),
          new Row(children: <Widget>[
            new WidgetDecoration(new Column(
              children: <Widget>[
                WidgetDecoration(Text('已还金额（元）',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff121C32))))
                    .padding(top: 18)
                    .align()
                    .build(),
                WidgetDecoration(Text('1000.00',
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff5783E8))))
                    .padding(bottom: 17, top: 5)
                    .align()
                    .build(),
              ],
            )).expanded().build(),
            new WidgetDecoration(new Column(
              children: <Widget>[
                WidgetDecoration(Text('借款金额（元）',
                        style:
                            TextStyle(fontSize: 15, color: Color(0xff121C32))))
                    .padding(top: 18)
                    .align()
                    .build(),
                WidgetDecoration(Text('2000.00',
                        style:
                            TextStyle(fontSize: 30, color: Color(0xff5783E8))))
                    .padding(bottom: 17, top: 5)
                    .align()
                    .build(),
              ],
            )).expanded().build(),
          ]),
          new Container(
            margin: CommonUtil.padding(bottom: 40),
            height: 1,
            color: Color(0xffD1D1D1),
          ),
          new Container(
//              margin: CommonUtil.padding(bottom: 19),
            height: 1,
            color: Color(0xffD1D1D1),
          ),
          new WidgetDecoration(
            Text('借款记录',
                style: TextStyle(fontSize: 14, color: Color(0xff121C32))),
          )
              .padding(top: 18, left: 19, bottom: 5)
              .align(alignment: Alignment.centerLeft)
              .build(),
          new Container(
            //              margin: CommonUtil.padding(bottom: 19),
            height: 1,
            color: Color(0xffD1D1D1),
          ),
        ],
      ),
    );
  }
}
