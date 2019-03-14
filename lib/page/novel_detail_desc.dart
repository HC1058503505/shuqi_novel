import 'package:flutter/material.dart';
import 'package:shuqi_novel/modle/novel_detail.dart';
import 'package:shuqi_novel/modle/const_value.dart';

class NovelDetailDesc extends StatefulWidget {
  NovelDetailDesc({this.novel});
  final NovelDetail novel;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NovelDetailDescState();
  }
}

class _NovelDetailDescState extends State<NovelDetailDesc> {
  int _novelIntroMaxLines = 3;
  List<Color> _tagsColor = <Color>[
    SQColor.primary,
    SQColor.secondary,
    SQColor.red,
    SQColor.orange,
    SQColor.blue
  ];

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
            child: Text(
              widget.novel.introduction,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15.0,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none),
              maxLines: _novelIntroMaxLines,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
            alignment: Alignment.centerRight,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  _novelIntroMaxLines = _novelIntroMaxLines == 3 ? 100 : 3;
                });
              },
              child: Icon((_novelIntroMaxLines == 3
                  ? Icons.keyboard_arrow_down
                  : Icons.keyboard_arrow_up)),
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 1,
            color: Colors.black12,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 40,
            child: Row(
              children: <Widget>[
                Image.asset("lib/img/detail_latest.png"),
                SizedBox(width: 5),
                Text(
                  "最新",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                SizedBox(width: 5),
                Text(widget.novel.lastChapter.title,
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none)),
                Expanded(
                  child: Container(),
                ),
                Text(
                  widget.novel.stat_name,
                  style: TextStyle(
                      color: SQColor.secondary,
                      fontSize: 12.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 1,
            color: Colors.black12,
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 40,
            child: Row(
              children: <Widget>[
                Image.asset("lib/img/detail_chapter.png"),
                SizedBox(width: 5),
                Text(
                  "目录",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15.0,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none),
                ),
                SizedBox(width: 5),
                Text("共${widget.novel.chapterNum}章节",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 12.0,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none)),
                Expanded(
                  child: Container(),
                ),
                Icon(
                  Icons.navigate_next,
                  color: Colors.grey,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
            height: 1,
            color: Colors.black12,
          ),
          Column(
            children: <Widget>[
              SizedBox(
                height: 10,
              ),
              Container(
                alignment: Alignment.centerLeft,
                padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: Wrap(
                  alignment: WrapAlignment.start,
                  spacing: 10,
                  children: widget.novel.tag.map<Widget>((tagItem) {
                    int index = widget.novel.tag.indexOf(tagItem);
                    return Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: _tagsColor[index])),
                      child: Text(
                        tagItem,
                        style: TextStyle(
                            color: _tagsColor[index],
                            fontSize: 12.0,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none),
                      ),
                    );
                  }).toList(),
                ),
              ),
              SizedBox(
                height: 10,
              )
            ],
          ),
          Container(
            color: Colors.black12.withAlpha(10),
            height: 10,
          )
        ],
      ),
    );
  }
}
