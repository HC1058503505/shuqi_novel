import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:shuqi_novel/page/novel_read_view.dart';

class NovelDetailBottom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    // Border.all(color: Colors.black12.withAlpha(10))
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.black12.withAlpha(10), width: 2.0 )),
      ),
      height: 64 + Screen.bottomSafeHeight,
      child: Row(
        children: <Widget>[
          Expanded(child: Container()),
          Text("加书架",
              style: TextStyle(
                  color: SQColor.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none)),
          Expanded(child: Container()),
          RaisedButton(
            onPressed: () {
              Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
                return ReaderView();
              }));
            },
            color: SQColor.primary,
            child: Text("开始阅读",
                style: TextStyle(
                    color: SQColor.white,
                    fontSize: 15,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none)),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(10.0))),
          ),
          Expanded(child: Container()),
          Text("下载",
              style: TextStyle(
                  color: SQColor.primary,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none)),
          Expanded(child: Container()),
        ],
      ),
    );
  }
}
