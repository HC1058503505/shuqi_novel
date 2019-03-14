import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/modle/novel_comment.dart';

class NovelDetailEvaluations extends StatelessWidget {
  NovelDetailEvaluations({this.comments});
  final List<NovelComment> comments;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.only(right: 20),
          height: 40,
          color: Colors.white,
          child: Row(
            children: <Widget>[
              Container(
                color: SQColor.primary,
                height: 20,
                width: 5,
              ),
              SizedBox(
                width: 10,
              ),
              Text("书友评价",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
              Expanded(
                child: Container(),
              ),
              Icon(
                Icons.edit,
                color: SQColor.primary,
                size: 20,
              ),
              Text("写书评",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none)),
            ],
          ),
        ),
        Container(
          child: Wrap(
            children: comments.map<Widget>((comment) {
              return _evaluationCell(comment);
            }).toList(),
          ),
        ),
        Container(
          height: 40.0,
          alignment: Alignment.center,
          child: Text("查看全部评论(486547}条)",
              style: TextStyle(
                  color: Colors.black87,
                  fontSize: 12,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none)),
        ),
        Container(
          height: 10.0,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }

  Widget _evaluationCell(NovelComment comment) {
    return Column(
      children: <Widget>[
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
          child: Row(
            children: <Widget>[
              CircleAvatar(
                backgroundImage: CachedNetworkImageProvider(comment.userPhoto),
                radius: 15,
              ),
              SizedBox(width: 10),
              Text(comment.nickName,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 12,
                      fontWeight: FontWeight.normal,
                      decoration: TextDecoration.none))
            ],
          ),
        ),
        Container(
          color: Colors.white,
          padding: EdgeInsets.fromLTRB(50, 0, 50, 10),
          child: Text(comment.text,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none)),
        ),
        Container(
          color: Colors.white,
          height: 1.0,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }
}
