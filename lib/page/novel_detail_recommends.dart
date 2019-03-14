import 'package:flutter/material.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/modle/novel_recommend.dart';
import 'package:shuqi_novel/page/new_page.dart';
import 'package:flutter/cupertino.dart';

class NovelDetailRecommends extends StatelessWidget {
  NovelDetailRecommends({this.recommends});
  final List<NovelRecommend> recommends;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            height: 40.0,
            child: Row(
              children: <Widget>[
                Container(
                  color: SQColor.primary,
                  height: 20,
                  width: 5,
                ),
                SizedBox(width: 10),
                Text("看过本书的人还在看",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none))
              ],
            ),
          ),
          Wrap(
            spacing: 15,
            runSpacing: 15,
            children: _recommendItem(context),
          )
        ],
      ),
    );
  }

  List<Widget> _recommendItem(BuildContext context) {
    return recommends.map<Widget>((recommend) {
      return GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return NewPage();
          }));
        },
        child: Container(
          width: (Screen.width - 5 * 15.0) / 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                child: CachedNetworkImage(imageUrl: recommend.book_cover),
              ),
              Text(recommend.bookname,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.none)),
              Text(recommend.author_name,
                  maxLines: 1,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none))
            ],
          ),
        ),
      );
    }).toList();
  }
}
