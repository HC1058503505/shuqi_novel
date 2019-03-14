import 'package:flutter/material.dart';

class Article {
  String content;
  int id;
  int next_id;
  int price;
  String title;
  int prev_id;
  int novel_id;

  List<Map<String, int>> pageOffset;
  Article.fromJson(Map<String, dynamic> article) {
    content = article["content"].toString();
    content = '　　' + content;
    content = content.replaceAll('\n', '\n　　');
    id = article["id"] as int;
    next_id = article["next_id"] as int;
    price = article["price"] as int;
    title = article["title"].toString();
    prev_id = article["prev_id"] as int;
    novel_id = article["novel_id"] as int;
  }

  String contentAtPage(int page) {
    var offset = pageOffset[page];
    String pageContent = content.substring(offset["start"], offset["end"]);
    if (pageContent.substring(0, 1) == "\n") {
      pageContent = pageContent.replaceFirst("\n", "");
    }
    return pageContent;
  }

  int get page {
    return pageOffset.length;
  }
}
