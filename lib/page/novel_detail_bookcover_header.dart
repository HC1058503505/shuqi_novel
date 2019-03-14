import 'package:flutter/material.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/modle/novel_detail.dart';

class NovelDetailCoverHeader extends StatelessWidget {
  NovelDetailCoverHeader({this.novel});
  final NovelDetail novel;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              width: Screen.width,
              height: 250,
              child: CachedNetworkImage(
                imageUrl:
                    "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg",
                fit: BoxFit.cover,
              ),
            ),
            Container(
              color: Colors.black.withAlpha(150),
              width: Screen.width,
              height: 250,
            ),
            Container(
              margin: EdgeInsets.only(top: 60.0 + Screen.topSafeHeight),
              width: Screen.width,
              height: 250.0 - 60.0 - Screen.topSafeHeight,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.white, width: 1.0)),
                    margin: EdgeInsets.fromLTRB(18.0, 0, 0, 15.0),
                    child: CachedNetworkImage(
                      imageUrl:
                          "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg",
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Container(
                            child: Text(novel.bookname,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    decoration: TextDecoration.none))),
                        SizedBox(height: 5),
                        Container(
                            child: Text(novel.author_name,
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 15.0,
                                    decoration: TextDecoration.none))),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text("${novel.wordCount}万字",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 15.0,
                                      decoration: TextDecoration.none)),
                              SizedBox(width: 10),
                              Text("${novel.price}书豆/千字",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 13.0,
                                      decoration: TextDecoration.none)),
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Text(
                                "评分：${novel.score}分",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 13.0,
                                    decoration: TextDecoration.none),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Image.asset("lib/img/detail_star.png"),
                              Image.asset("lib/img/detail_star.png"),
                              Image.asset("lib/img/detail_star.png"),
                              Image.asset("lib/img/detail_star.png"),
                              Image.asset("lib/img/detail_star.png")
                            ],
                          ),
                        ),
                        SizedBox(height: 5),
                        Container(
                          child: Row(
                            children: <Widget>[
                              Image.asset("lib/img/read_icon_vip.png"),
                              Text(
                                "续费包月会员，万本小说免费读 >",
                                style: TextStyle(
                                    color: Colors.orangeAccent,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.normal,
                                    decoration: TextDecoration.none),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ],
    );
  }
}
