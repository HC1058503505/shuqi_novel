import 'package:flutter/material.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/page/bookstore_tabitem.dart';
import 'package:shuqi_novel/tools/screen.dart';

class BookStore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookStoreState();
  }
}

class _BookStoreState extends State<BookStore>
    with SingleTickerProviderStateMixin {
  List<String> _tabs = <String>["精选", "女生", "男生", "漫画"];
  TabController _tabController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: _tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: <Widget>[
        Container(
          child: Padding(
            padding: EdgeInsets.fromLTRB(50.0, Screen.topSafeHeight, 50.0, 10),
            child: TabBar(
              indicatorSize: TabBarIndicatorSize.label,
              unselectedLabelStyle: TextStyle(color: Colors.black12),
              labelStyle:
                  TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
              labelColor: Colors.black,
              indicatorColor: SQColor.secondary,
              tabs: _tabs.map<Widget>((tab) {
                return Container(
                  child: Tab(
                    text: tab,
                  ),
                );
              }).toList(),
              controller: _tabController,
            ),
          ),
        ),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            children: <Widget>[
              BookStoreTabBarItem(category: BookStoreCategory.excellent),
              BookStoreTabBarItem(category: BookStoreCategory.female),
              BookStoreTabBarItem(category: BookStoreCategory.male),
              BookStoreTabBarItem(category: BookStoreCategory.cartoon),
            ],
          ),
        )
      ],
    );
  }
}
