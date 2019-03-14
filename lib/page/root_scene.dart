import 'package:flutter/material.dart';
import 'package:shuqi_novel/page/bookshelf_page.dart';
import 'package:shuqi_novel/page/bookstore_page.dart';
import 'package:shuqi_novel/page/me_page.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/tools/event_bus.dart';
class AppScene extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _AppSceneState();
  }
}

class _AppSceneState extends State<AppScene> {

  int _tabIndex = 1;
  
  List<Map<String, String>> _tabItems= <Map<String, String>>[
    {"title" : "书架", "imgName" : "lib/img/tab_bookshelf"},
    {"title" : "书城", "imgName" : "lib/img/tab_bookstore"},
    {"title" : "我", "imgName" : "lib/img/tab_me"}
  ];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bus.add("BookShelfAdd", (arg){
      setState(() {
        _tabIndex = 1;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: IndexedStack(
          children: <Widget>[
            BookShelf(),
            BookStore(),
            Me()
          ],
          index: _tabIndex,
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          fixedColor: SQColor.primary,
          items: _tabItems.map<BottomNavigationBarItem>((item){
            return BottomNavigationBarItem(
                icon: Image.asset(item["imgName"] + "_n.png"),
                title: Text(item["title"]),
                activeIcon: Image.asset(item["imgName"] + "_p.png")
            );
          }).toList(),
          onTap: (index){
            setState(() {
              _tabIndex = index;
            });
          },
          currentIndex: _tabIndex,
        ),
      ),
    );
  }
}