import 'package:flutter/material.dart';
import 'package:shuqi_novel/tools/screen.dart';

class NovelDetailNavbar extends StatefulWidget {
  NovelDetailNavbar({this.alphaNav, this.title});
  final double alphaNav;
  final String title;
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NovelDetailNavbarState();
  }
}

class _NovelDetailNavbarState extends State<NovelDetailNavbar> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: 64.0 + Screen.topSafeHeight,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(left: 17),
            height: 60.0 + Screen.topSafeHeight,
            child: Container(
              padding: EdgeInsets.only(top: Screen.topSafeHeight),
              margin: EdgeInsets.all(0),
              child: GestureDetector(
                onTap: () {
                  Navigator.of(context).pop();
                },
                child: Icon(Icons.arrow_back_ios, color: Colors.white),
              ),
            ),
          ),
          Opacity(
            opacity: widget.alphaNav,
            child: AppBar(
              elevation: 0,
              iconTheme: IconThemeData(color: Colors.black),
              backgroundColor: Colors.white,
              title: Text(
                widget.title,
                style: TextStyle(color: Colors.black),
              ),
            ),
          )
        ],
      ),
    );
  }
}
