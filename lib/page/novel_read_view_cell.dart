import 'package:flutter/material.dart';
import 'package:battery/battery.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:shuqi_novel/modle/article.dart';

class ReadViewCell extends StatefulWidget {
  ReadViewCell({this.article, this.page});
  Article article;
  int page;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReadVeiwCellState();
  }
}

class _ReadVeiwCellState extends State<ReadViewCell> {
  int batteryL = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    var battery = Battery();
    battery.batteryLevel.then((value) {
      setState(() {
        batteryL = value;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Column(
        children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, Screen.topSafeHeight, 0, 0),
            height: 37.0,
            width: Screen.width,
            child: Padding(
              padding: EdgeInsets.all(0),
              child: Text(
                widget.article.title,
                textAlign: TextAlign.left,
                style: TextStyle(
                  fontSize: 20.0,
                  color: Colors.black45,
                  fontWeight: FontWeight.normal,
                  decoration: TextDecoration.none,
                ),
              ),
            ),
          ),
          Container(
            height: Screen.height -
                Screen.topSafeHeight -
                Screen.bottomSafeHeight -
                37.0 * 2.0,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Text(
                widget.article.contentAtPage(widget.page),
                style: TextStyle(
                    fontSize: 20.0,
                    color: Colors.black,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
              ),
            ),
          ),
          Container(
            height: 37.0,
            width: Screen.width,
            child: Padding(
              padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: Container(
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: EdgeInsets.only(right: 5),
                      child: Stack(
                        alignment: Alignment.centerLeft,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.fromLTRB(3.8, 0, 0, 0),
                            color: Colors.black45,
                            width: 20.0 * batteryL / 100.0,
                            height: 8,
                          ),
                          Container(
                            child: Image.asset(
                              "lib/img/reader_battery.png",
                              height: 20,
                              width: 30,
                              color: Colors.black45,
                            ),
                          )
                        ],
                      ),
                    ),
                    Text("$batteryL%",
                        style: TextStyle(
                            fontSize: 15.0,
                            color: Colors.black,
                            fontWeight: FontWeight.normal,
                            decoration: TextDecoration.none)),
                    Expanded(child: Container()),
                    Text(
                      "第${widget.page + 1}页",
                      style: TextStyle(
                        fontSize: 15.0,
                        color: Colors.black,
                        fontWeight: FontWeight.normal,
                        decoration: TextDecoration.none,
                      ),
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
