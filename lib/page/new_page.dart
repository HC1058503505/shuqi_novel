import 'package:flutter/material.dart';
import 'package:shuqi_novel/modle/const_value.dart';
import 'package:shuqi_novel/tools/dio_manager.dart';
import 'package:shuqi_novel/modle/article.dart';
import 'package:shuqi_novel/modle/novel_detail.dart';
import 'package:shuqi_novel/tools/screen.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:shuqi_novel/modle/novel_comment.dart';
import 'package:shuqi_novel/modle/novel_recommend.dart';
import 'package:shuqi_novel/page/novel_detail_navigator_bar.dart';
import 'package:shuqi_novel/page/novel_detail_bookcover_header.dart';
import 'package:shuqi_novel/page/novel_detail_desc.dart';
import 'package:shuqi_novel/page/novel_detail_evaluations.dart';
import 'package:shuqi_novel/page/novel_detail_recommends.dart';
import 'package:shuqi_novel/page/novel_detail_bottom.dart';

class NewPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _NewPageSate();
  }
}

class _NewPageSate extends State<NewPage> {
  int _page = 0;
  NovelDetail _novelDetail;
  List<NovelComment> _comments;
  List<NovelRecommend> _recommends;

  ScrollController _scrollController;
  double alphaNav = 0.0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(() {
      if (_scrollController.offset > 64.0 + Screen.topSafeHeight) {
        setState(() {
          alphaNav = 1.0;
        });
      } else if (_scrollController.offset <= 0) {
        setState(() {
          alphaNav = 0.0;
        });
      } else {
        setState(() {
          alphaNav = _scrollController.offset / (64.0 + Screen.topSafeHeight);
        });
      }
    });
    _loadDetail();
    _loadComment();
    _loadRecommend();
  }

  void _loadDetail() async {
    Map<String, dynamic> result = await DioManager.singleton
        .get(url: "novel_detail") as Map<String, dynamic>;

    setState(() {
      _novelDetail = NovelDetail.fromJson(result);
    });
  }

  void _loadComment() async {
    List<dynamic> result =
        await DioManager.singleton.get(url: "novel_comment") as List<dynamic>;
    setState(() {
      _comments = NovelComment.parseJsonList(result);
    });
  }

  void _loadRecommend() async {
    List<dynamic> result =
        await DioManager.singleton.get(url: "novel_recommend") as List<dynamic>;
    setState(() {
      _recommends = NovelRecommend.parseJsonList(result);
    });
  }

  Future<void> _onRefresh() {
    setState(() {});
  }

  Widget _navigatorBar() {
    if (_novelDetail == null) {
      return Container();
    }
    return NovelDetailNavbar(alphaNav: alphaNav, title: _novelDetail.bookname);
  }

  Widget _novelHeader() {
    return NovelDetailCoverHeader(novel: _novelDetail);
  }

  Widget _novelDescCellItem() {
    return NovelDetailDesc(novel: _novelDetail);
  }

  Widget _novelEvaluationsCellItem() {
    return NovelDetailEvaluations(comments: _comments);
  }

  Widget _listCellItem(context, index) {
    switch (index) {
      case 0:
        if (_novelDetail == null) {
          return Container();
        }
        return _novelHeader();
        break;
      case 1:
        if (_novelDetail == null) {
          return Container();
        }
        return _novelDescCellItem();
        break;
      case 2:
        if (_comments == null) {
          return Container();
        }
        return _novelEvaluationsCellItem();
        break;
      case 3:
        if (_recommends == null) {
          return Container();
        }
        return NovelDetailRecommends(recommends: _recommends);
        break;
      default:
        return Text("Test");
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      padding: EdgeInsets.only(bottom: Screen.bottomSafeHeight),
      color: Colors.white,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: <Widget>[
          Stack(
            children: <Widget>[
              RefreshIndicator(
                onRefresh: _onRefresh,
                child: ListView.builder(
                  padding: EdgeInsets.fromLTRB(
                      0, 0, 0, 64 + Screen.bottomSafeHeight),
                  controller: _scrollController,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return _listCellItem(context, index);
                  },
                ),
              ),
              _navigatorBar()
            ],
          ),
          NovelDetailBottom()
        ],
      ),
    );
  }
}
