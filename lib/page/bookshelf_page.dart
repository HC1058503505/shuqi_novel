import 'package:flutter/material.dart';
import 'package:shuqi_novel/tools/dio_manager.dart';
import 'package:shuqi_novel/modle/book_brief.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:shuqi_novel/page/new_page.dart';
import 'package:shuqi_novel/tools/event_bus.dart';
import 'package:shuqi_novel/modle/const_value.dart';

class BookShelf extends StatefulWidget {
  BookShelf();

  factory BookShelf.forDesignTime() {
    // TODO: add arguments
    return new BookShelf();
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookShelfState();
  }
}

class _BookShelfState extends State<BookShelf> {
  List<BookBrief> bookShelf = List();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    getBookShelf();
  }

  void getBookShelf() async {
    List<dynamic> resultData =
        await DioManager.singleton.get(url: "bookshelf") as List<dynamic>;

    List<BookBrief> books = resultData.map<BookBrief>((book) {
      return BookBrief.fromJson(book);
    }).toList();

    setState(() {
      bookShelf.addAll(books);
    });
  }

  Widget _navigationBar(Color iconColor) {
    return AppBar(
      title: Text("书架"),
      backgroundColor: Colors.white,
      actions: <Widget>[
        Image.asset('img/actionbar_checkin.png', color: iconColor),
        Image.asset('img/actionbar_search.png', color: iconColor)
      ],
    );
  }

  // 生成书架GridItem
  // 可在出城添加新的书籍
  // 这里也要做出相应的添加
  List<Widget> _bookShelfList() {
    List<Widget> temp = List();
    Stack addStack = Stack(
      alignment: AlignmentDirectional.center,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.all(0.0),
          child: Container(
            color: Colors.black12,
          ),
        ),
        Icon(
          Icons.add,
          color: Colors.black,
        )
      ],
    );

    GestureDetector gestureAdd = GestureDetector(
      onTap: () {
        bus.emit("BookShelfAdd");
      },
      child: addStack,
    );

    if (bookShelf.length == 0) {
      temp.add(gestureAdd);
      return temp;
    }

    for (int i = 1; i < (bookShelf.length); i++) {
      BookBrief novel = bookShelf[i];
      Stack novelGrid = Stack(
        alignment: AlignmentDirectional.bottomCenter,
        children: <Widget>[
          CachedNetworkImage(
            imageUrl: novel.book_cover,
          ),
          Container(
            color: Colors.black.withAlpha(120),
            height: 20.0,
          ),
          Container(
            padding: EdgeInsets.fromLTRB(10.0, 0, 10.0, 0),
            child: Text(novel.bookname,
                maxLines: 1,
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.0,
                    fontWeight: FontWeight.normal,
                    decoration: TextDecoration.none),
                overflow: TextOverflow.ellipsis),
          )
        ],
      );

      GestureDetector gestureGrid = GestureDetector(
        onTap: () {
          Navigator.of(context).push(CupertinoPageRoute(builder: (context) {
            return NewPage();
          }));
        },
        child: novelGrid,
      );
      temp.add(gestureGrid);
    }

    temp.add(gestureAdd);
    return temp;
  }

  FlexibleSpaceBar _sliverFlexSpace() {
    return FlexibleSpaceBar(
      background: Stack(
        children: <Widget>[
          Image.asset("lib/img/bookshelf_bg.png",
              fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Image.asset("lib/img/bookshelf_cloud_0.png",
              fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Image.asset("lib/img/bookshelf_cloud_1.png",
              fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Image.asset("lib/img/bookshelf_cloud_2.png",
              fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          Image.asset("lib/img/bookshelf_cloud_3.png",
              fit: BoxFit.fill, width: MediaQuery.of(context).size.width),
          PreferredSize(
              child: Padding(
                padding: EdgeInsets.fromLTRB(20.0, 94.0, 20.0, 20.0),
                child: Row(
                  children: <Widget>[
                    SizedBox(
                      width: 120.0,
                      child: CachedNetworkImage(
                          imageUrl: bookShelf.length == 0
                              ? "http://img-tailor.11222.cn/bcv/big/201901031812421599.jpg"
                              : bookShelf[0].book_cover),
                    ),
                    Padding(
                      padding: EdgeInsets.all(20.0),
                      child: SizedBox(
                        height: 120.0 * 0.75,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              bookShelf.length == 0
                                  ? "逆天神医"
                                  : bookShelf[0].bookname,
                              style: TextStyle(
                                  fontSize: 20.0,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),
                            Row(
                              children: <Widget>[
                                Text(
                                  "读至0.2%",
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 12.0),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 10.0),
                                  child: Center(
                                    child: Container(
                                      child: Column(
                                        children: <Widget>[
                                          Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Center(
                                              child: Text(
                                                "继续阅读",
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 12.0),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                InkWell(
                                  enableFeedback: false,
                                  child: Icon(Icons.navigate_next,
                                      color: Colors.white),
                                  onTap: () {},
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              preferredSize: Size(MediaQuery.of(context).size.width, 100))
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Container(
        color: Colors.white,
        child: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              /**
               * 如果没有leading，automaticallyImplyLeading为true，就会默认返回箭头
               * 如果 没有leading 且为false，空间留给title
               * 如果有leading，这个参数就无效了
               */
              title: Text("书城"),
              // title: Text('大标题'), //标题
              centerTitle: true, //标题是否居中
              actions: [
                Image.asset(
                  'lib/img/actionbar_checkin.png',
                  color: Colors.white,
                  width: 40.0,
                ),
                Image.asset(
                  'lib/img/actionbar_search.png',
                  color: Colors.white,
                  width: 40.0,
                )
              ], //右侧的内容和点击事件啥的
              elevation: 4, //阴影的高度
              forceElevated: false, //是否显示阴影
              backgroundColor: SQColor.primary, //背景颜色
              brightness: Brightness.dark, //黑底白字，lignt 白底黑字
              textTheme: TextTheme(), //字体样式
              primary: true, // appbar是否显示在屏幕的最上面，为false是显示在最上面，为true就显示在状态栏的下面
              titleSpacing: 16, //标题两边的空白区域
              expandedHeight: 250.0, //默认高度是状态栏和导航栏的高度，如果有滚动视差的话，要大于前两者的高度
              floating:
                  false, //滑动到最上面，再滑动是否隐藏导航栏的文字和标题等的具体内容，为true是隐藏，为false是不隐藏
              pinned: true, //是否固定导航栏，为true是固定，为false是不固定，往上滑，导航栏可以隐藏
              snap:
                  false, //只跟floating相对应，如果为true，floating必须为true，也就是向下滑动一点儿，整个大背景就会动画显示全部，网上滑动整个导航栏的内容就会消失
              flexibleSpace: _sliverFlexSpace(),
            ),
            SliverGrid.count(
              crossAxisCount: 3,
              childAspectRatio: 0.75,
              mainAxisSpacing: 10.0,
              crossAxisSpacing: 10.0,
              children: _bookShelfList(),
            )
          ],
        ),
      ),
    );
  }
}
