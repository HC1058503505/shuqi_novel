import 'package:flutter/material.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';
import 'package:shuqi_novel/tools/event_bus.dart';
import 'package:shuqi_novel/modle/article.dart';

class ReaderViewToolBar extends StatefulWidget {
  ReaderViewToolBar({this.article});
  Article article;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReaderViewToolBarState();
  }
}

class _ReaderViewToolBarState extends State<ReaderViewToolBar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          _readPageTopToolBar(),
          Expanded(
            child: Container(),
          ),
          _readPageBottomToolBar()
        ],
      ),
    );
  }

  Widget _readPageTopToolBar() {
    return Container(
      height: Screen.topSafeHeight + 64.0,
      child: AppBar(
        centerTitle: true,
        title: Text(
          widget.article == null ? "" : widget.article.title,
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: IconThemeData(color: Colors.black),
        backgroundColor: Colors.white,
        actions: <Widget>[
          InkWell(
            child: Image.asset("lib/img/read_icon_voice.png"),
            splashColor: Colors.white,
            highlightColor: Colors.white,
            onTap: () {},
          ),
          SizedBox(width: 20),
          InkWell(
            child: Image.asset("lib/img/read_icon_more.png"),
            splashColor: Colors.white,
            highlightColor: Colors.white,
            onTap: () {},
          ),
          SizedBox(width: 20)
        ],
      ),
    );
  }

  Widget _readPageBottomToolBar() {
    return Container(
      color: Colors.white,
      height: Screen.bottomSafeHeight + 118.0,
      child: Container(
        color: Colors.white,
        child: Column(
          children: <Widget>[_readProgress(), _readSettingToolBar()],
        ),
      ),
    );
  }

  Widget _readProgress() {
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: LinearPercentIndicator(
        width: Screen.width - 80,
        lineHeight: 2.0,
        leading: GestureDetector(
          onTap: () {
            // 上一章
            bus.emit("PreviousChapter");
          },
          child: Container(
            child: Image.asset(
              "lib/img/read_icon_chapter_previous.png",
              width: 40.0,
            ),
          ),
        ),
        trailing: GestureDetector(
          onTap: () {
            // 下一章
            bus.emit("NextChapter");
          },
          child: Container(
            child: Image.asset(
              "lib/img/read_icon_chapter_next.png",
              width: 40,
            ),
          ),
        ),
        progressColor: SQColor.primary,
        percent: 0.25,
        linearStrokeCap: LinearStrokeCap.roundAll,
      ),
    );
  }

  Widget _readSettingToolBar() {
    List<Map<String, String>> setBar = <Map<String, String>>[
      {"title": "目录", "icon": "lib/img/read_icon_catalog.png"},
      {"title": "亮度", "icon": "lib/img/read_icon_brightness.png"},
      {"title": "字体", "icon": "lib/img/read_icon_font.png"},
      {"title": "设置", "icon": "lib/img/read_icon_setting.png"},
    ];
    return Container(
      padding: EdgeInsets.only(top: 10),
      child: Wrap(
        children: setBar.map<Widget>((bar) {
          return Container(
            width: Screen.width / (setBar.length + 1),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Image.asset(bar["icon"]),
                Text(
                  bar["title"],
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
