import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:shuqi_novel/page/new_page.dart';
import 'package:shuqi_novel/modle/bookstore_banner.dart';
import 'package:shuqi_novel/modle/book_brief.dart';
import 'package:shuqi_novel/modle/bookstore_module.dart';
import 'package:shuqi_novel/tools/dio_manager.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/page/bookstore_banner_view.dart';
import 'package:shuqi_novel/modle/const_value.dart';
enum BookStoreCategory { excellent, female, male, cartoon }

class BookStoreTabBarItem extends StatefulWidget {
  BookStoreTabBarItem({this.category});

  final BookStoreCategory category;

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _BookStoreTabBarItemState();
  }
}

class _BookStoreTabBarItemState extends State<BookStoreTabBarItem>
    with AutomaticKeepAliveClientMixin {
  List<BookStoreModule> moduleList = List();
  ScrollController _controller = ScrollController();

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _modules();
  }

  void _modules() async {
    String url;

    switch (widget.category) {
      case BookStoreCategory.excellent:
        url = "home_excellent";
        break;
      case BookStoreCategory.female:
        url = "home_female";
        break;
      case BookStoreCategory.male:
        url = "home_male";
        break;
      case BookStoreCategory.cartoon:
        url = "home_cartoon";
        break;
    }

    dynamic result =
        await DioManager.singleton.get(url: url) as Map<String, dynamic>;
    List<dynamic> module = result["module"] as List<dynamic>;
    setState(() {
      moduleList.addAll(BookStoreModule.parseJson(module));
    });
  }

  // banner
  Widget _swiperHeader() {
    return BookStoreBannerView(banners: moduleList[0].content);
  }

  // menulist
  Widget _navigatorMenu() {
    List<Map<String, String>> menus = <Map<String, String>>[
      {"icon": "menu_category.png", "title": "分类"},
      {"icon": "menu_rank.png", "title": "榜单"},
      {"icon": "menu_vip.png", "title": "会员"},
      {"icon": "menu_complete.png", "title": "完结"},
      {"icon": "menu_publish.png", "title": "出版"}
    ];
    return Padding(
      padding: EdgeInsets.fromLTRB(0, 10.0, 0, 10.0),
      child: Row(
        children: menus.map<Widget>((menu){
          return Expanded(
            child: Column(
              children: <Widget>[
                Image.asset("lib/img/${menu["icon"]}"),
                Text(
                  menu["title"],
                  style: TextStyle(color: Colors.black54),
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _sectionHeader(String sectionName) {
    return Container(
      child: Row(
        children: <Widget>[
          Container(
            color: SQColor.secondary,
            width: 5,
            height: 15,
          ),
          SizedBox(width: 5,),
          Text(sectionName, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 15),)
        ],
      ),
    );
  }

  Widget _novelGridStyle(List<BookBrief> books, String sectionName){
    return Column(
      children: <Widget>[
        Container(
          padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _sectionHeader(sectionName),
              SizedBox(height: 10.0),
              Wrap(
                spacing: 15.0,
                runSpacing: 20.0,
                children: books.map<Widget>((book){
                  return Container(
                    width: (MediaQuery.of(context).size.width - 20.0 - 15.0 * 3) / 4,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                          return NewPage();
                        }));
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          CachedNetworkImage(imageUrl: book.book_cover),
                          Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.5), maxLines: 1, overflow: TextOverflow.ellipsis,),
                          Text(book.author_name, style: TextStyle(color: Colors.black54, fontSize: 11))
                        ],
                      ),
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }


  List<Widget> _hybridStyleWidgets(List<BookBrief> books) {
    List<Widget> temp = List<Widget>();
    if (books == null || books.length == 0) return temp;

    for(int i = 0; i < books.length; i++) {
      BookBrief book = books[i];
      Container tempContainer;
      if(i < 4) {
        tempContainer = Container(
          width: (MediaQuery.of(context).size.width - 20.0 - 15.0 * 3) / 4,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                return NewPage();
              }));
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                CachedNetworkImage(imageUrl: book.book_cover),
                Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.5), maxLines: 1, overflow: TextOverflow.ellipsis,),
                Text(book.author_name, style: TextStyle(color: Colors.black54, fontSize: 11))
              ],
            ),
          )
        );

      } else {
        tempContainer = Container(
          width: (MediaQuery.of(context).size.width - 20.0 - 15.0) / 2,
          child: GestureDetector(
            onTap: (){
              Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                return NewPage();
              }));
            },
            child: Row(
              children: <Widget>[
                Expanded(child: CachedNetworkImage(imageUrl: book.book_cover)),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                        Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                        Text("${(int.parse(book.recommend_num) ~/ 10000)}万人推荐", style: TextStyle(color: Colors.black54, fontSize: 11))
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        );
      }
      temp.add(tempContainer);
    }

    return temp;
  }

  Widget _novelHybridStyle(List<BookBrief> books, String sectionName){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _sectionHeader(sectionName),
              SizedBox(height: 10),
              Container(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 20,
                  children: _hybridStyleWidgets(books),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }

  
  List<Widget> _thousandLikeWidgets(List<BookBrief> books){
    List<Widget> temp = List<Widget>();
    if (books == null || books.length == 0) return temp;
    
    for(int i = 0; i < books.length; i++){
      BookBrief book = books[i];
      Container container;
      if(i == 0) {
        container = Container(
          child: Row(
            children: <Widget>[
              Expanded(
                flex: 1,
                child: CachedNetworkImage(imageUrl: book.book_cover)
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0 , 10, 0),
                  child: GestureDetector(
                    onTap: (){
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                        return NewPage();
                      }));
                    },
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                        Text(book.book_info, style: TextStyle(color: Colors.black54, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis,),
                        Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Row(
                            children: <Widget>[
                              Text(book.author_name),
                              Expanded(child: Container()),
                              Container(
                                margin: EdgeInsets.only(right: 10),
                                padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                                child: Text(book.stat_name, style: TextStyle(color: SQColor.secondary)),
                                decoration: BoxDecoration(
                                    border: Border.all(color: SQColor.secondary, width: 0.5)
                                ),
                              ),
                              Text(book.category_name)
                            ],
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
      } else {
        container = Container(
            width: (MediaQuery.of(context).size.width - 20.0 - 15.0 * 3) / 4,
            child: GestureDetector(
              onTap: (){
                Navigator.of(context).push(CupertinoPageRoute(builder: (context){
                  return NewPage();
                }));
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  CachedNetworkImage(imageUrl: book.book_cover),
                  Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 12.5), maxLines: 1, overflow: TextOverflow.ellipsis,),
                  Text(book.author_name, style: TextStyle(color: Colors.black54, fontSize: 11))
                ],
              ),
            )
        );
      }

      temp.add(container);
    }
    return temp;
  }
  Widget _novelthousandLike(List<BookBrief> books, String sectionName){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _sectionHeader(sectionName),
              SizedBox(height: 10,),
              Container(
                child: Wrap(
                  spacing: 15,
                  runSpacing: 20,
                  children: _thousandLikeWidgets(books),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }

  
  List<Widget> _listStyleWidgets(List<BookBrief> books){
    return books.map<Widget>((book){
      return Container(
        child: GestureDetector(
          onTap: (){
            Navigator.of(context).push(CupertinoPageRoute(builder: (context){
              return NewPage();
            }));
          },
          child: Row(
            children: <Widget>[
              Expanded(
                  flex: 1,
                  child: CachedNetworkImage(imageUrl: book.book_cover)
              ),
              Expanded(
                flex: 4,
                child: Padding(
                  padding: EdgeInsets.fromLTRB(10, 0 , 10, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(book.bookname, style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15)),
                      Text(book.book_info, style: TextStyle(color: Colors.black54, fontSize: 13), maxLines: 2, overflow: TextOverflow.ellipsis,),
                      Padding(
                        padding: EdgeInsets.only(top: 10),
                        child: Row(
                          children: <Widget>[
                            Text(book.author_name),
                            Expanded(child: Container()),
                            Container(
                              margin: EdgeInsets.only(right: 10),
                              padding: EdgeInsets.fromLTRB(5, 0, 5, 0),
                              child: Text(book.stat_name, style: TextStyle(color: SQColor.secondary)),
                              decoration: BoxDecoration(
                                  border: Border.all(color: SQColor.secondary, width: 0.5)
                              ),
                            ),
                            Text(book.category_name)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }).toList();
  }

  Widget _novelListStyle(List<BookBrief> books, String sectionName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              _sectionHeader(sectionName),
              Container(
                padding: EdgeInsets.only(top: 10),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 20,
                  children: _listStyleWidgets(books),
                ),
              )
            ],
          ),
        ),
        SizedBox(
          height: 10,
          child: Container(
            color: Colors.black12.withAlpha(10),
          ),
        )
      ],
    );
  }

  // modules
  Widget _moduleWidget(BookStoreModule module) {
    switch (module.style) {
      case 1:
        return _novelGridStyle(module.content as List<BookBrief>, module.m_s_name);
        break;
      case 2:
        return _novelHybridStyle(module.content as List<BookBrief>, module.m_s_name);
        break;
      case 3:
        return _novelthousandLike(module.content as List<BookBrief>, module.m_s_name);
        break;
      case 4:
        return _novelListStyle(module.content as List<BookBrief>, module.m_s_name);
        break;
    }
  }

  Widget _listViewCell(BuildContext context, int index) {
    if(index == 0) {
      return _swiperHeader();
    } else if (widget.category == BookStoreCategory.excellent && index == 1) {
      return _navigatorMenu();
    }

    return _moduleWidget(moduleList[index]);
  }

  @override
  Widget build(BuildContext context) {

    return Container(
      child: RefreshIndicator(
          child: ListView.builder(
            padding: EdgeInsets.all(0),
            itemCount: moduleList.length,
            itemBuilder: (context, index){
              return _listViewCell(context, index);
            },
          ),
          onRefresh: (){

          }
      ),
    );
  }
}

