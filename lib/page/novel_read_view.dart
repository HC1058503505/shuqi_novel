import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shuqi_novel/page/novel_read_view_toolbar.dart';
import 'package:shuqi_novel/tools/dio_manager.dart';
import 'package:shuqi_novel/modle/article.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:shuqi_novel/page/novel_read_view_cell.dart';
import 'package:shuqi_novel/tools/event_bus.dart';

class ReaderView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _ReaderView();
  }
}

class _ReaderView extends State<ReaderView> {
  PageController pageController;
  bool isShowTools = false;
  int chapter = 0;
  Article article;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pageController = PageController();
    getArticles();

    bus.add("PreviousChapter", (dynamic arg) {
      if (chapter <= 0) {
        return;
      }
      setState(() {
        chapter--;
        getArticles();
      });
    });

    bus.add("NextChapter", (dynamic arg) {
      if (chapter >= 6) {
        return;
      }
      setState(() {
        chapter++;
        getArticles();
      });
    });
  }

  void getArticles() async {
    Map<String, dynamic> result = await DioManager.singleton
        .get(url: "article_100$chapter") as Map<String, dynamic>;
    setState(() {
      article = Article.fromJson(result);
      article.pageOffset = _getPageOffset();
      pageController.jumpToPage(0);
    });
  }

  List<Map<String, int>> _getPageOffset() {
    Size maxSize = Size(
        Screen.width - 20.0,
        Screen.height -
            Screen.topSafeHeight -
            Screen.bottomSafeHeight -
            37.0 * 2.0 - 20.0);
    double fontSize = 20.0;
    String tempStr = article.content;
    List<Map<String, int>> pageConfig = [];
    int last = 0;
    while (true) {
      Map<String, int> offset = {};
      offset['start'] = last;
      TextPainter textPainter = TextPainter(textDirection: TextDirection.ltr);
      textPainter.text =
          TextSpan(text: tempStr, style: TextStyle(fontSize: fontSize));
      textPainter.layout(maxWidth: maxSize.width);
      var end = textPainter
          .getPositionForOffset(Offset(maxSize.width, maxSize.height))
          .offset;

      if (end == 0) {
        break;
      }
      tempStr = tempStr.substring(end, tempStr.length);
      offset['end'] = last + end;
      last = last + end;
      pageConfig.add(offset);
    }

    return pageConfig;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          image: DecorationImage(
              image: AssetImage("lib/img/read_bg.png"), fit: BoxFit.fill)),
      child: Stack(
        children: <Widget>[
          Offstage(
            offstage: article == null,
            child: GestureDetector(
              onTap: () {
                setState(() {
                  isShowTools = !isShowTools;
                });
              },
              child: PageView.builder(
                controller: pageController,
                itemCount: article == null ? 0 : article.pageOffset.length,
                itemBuilder: (context, index) {
                  return ReadViewCell(article: article, page: index);
                },
              ),
            ),
          ),
          Offstage(
            offstage: !isShowTools,
            child: ReaderViewToolBar(article: article),
          )
        ],
      ),
    );
  }
}
