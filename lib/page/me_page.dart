import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/tools/screen.dart';

class MeListItem {
  MeListItem({this.icon, this.title});

  IconData icon;
  String title;
}

class Me extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MeState();
  }
}

class _MeState extends State<Me> {
  List<MeListItem> items = <MeListItem>[
    MeListItem(icon: Icons.favorite_border, title: "收藏"),
    MeListItem(icon: Icons.account_balance_wallet, title: "钱包"),
    MeListItem(icon: Icons.remove_red_eye, title: "消费充值记录"),
    MeListItem(icon: Icons.book, title: "购买的图书"),
    MeListItem(icon: Icons.settings, title: "设置"),
    MeListItem(icon: Icons.print, title: "打印")
  ];
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: ListView.builder(
        itemCount: items.length + 1,
        itemBuilder: (context, index) {
          if (index == 0) {
            return Container(
              padding: EdgeInsets.fromLTRB(20, Screen.topSafeHeight, 20, 20),
              child: Row(
                children: <Widget>[
                  CircleAvatar(
                    backgroundColor: Colors.white,
                    backgroundImage: CachedNetworkImageProvider(
                        "https://upload.jianshu.io/users/upload_avatars/988002/6195ac7fa7a8.png?imageMogr2/auto-orient/strip|imageView2/1/w/240/h/240"),
                    radius: 40,
                  ),
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(left: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            "HouCong",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.none),
                          ),
                          SizedBox(height: 10),
                          Row(
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.fromLTRB(0, 5, 20, 5),
                                child: Column(
                                  children: <Widget>[
                                    Text("110.0",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none)),
                                    Text("书豆",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Column(
                                  children: <Widget>[
                                    Text("9990",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none)),
                                    Text("书券",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none))
                                  ],
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.fromLTRB(20, 5, 20, 5),
                                child: Column(
                                  children: <Widget>[
                                    Text("99990",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none)),
                                    Text("月票",
                                        style: TextStyle(
                                            color: Colors.black26,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15,
                                            decoration: TextDecoration.none))
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            );
          }

          return ListTile(
            leading: Icon(items[index - 1].icon),
            title: Text(items[index - 1].title),
            trailing: Icon(Icons.navigate_next),
          );
        },
      ),
    );
  }
}
