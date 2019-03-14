//import 'package:flutter/material.dart';

class BookBrief {
  String bid;
  String bookname;
  String introduction;
  String book_info;
  String chapterid;
  String topic;
  String topic_first;
  int date_updated;
  String author;
  String author_name;
  String top_class;
  String state;
  String readCount;
  String praiseCount;
  String stat_name;
  String category; // String class
  String category_name; // String class_name
  String size;
  String book_cover;
  String chapterid_first;
  String chargeMode;
  String digest;
  String price;
  List<String> tag;
  int is_new;
  int discountNum;
  int quick_price;
  String formats;
  int audiobook_playCount;
  String chapterNum;
  bool isShortStory;
  String userid;
  int search_heat;
  int num_click;
  String recommend_num;
  String first_cate_id;
  String first_cate_name;
  String reason;


  BookBrief.fromJson(Map<String, dynamic> bookJson) {
    bid = bookJson["bid"].toString();
    bookname = bookJson["bookname"].toString();
    introduction = bookJson["introduction"].toString();
    book_info = bookJson["book_info"].toString();
    chapterid = bookJson["chapterid"].toString();
    topic = bookJson["topic"].toString();
    topic_first = bookJson["topic_first"].toString();
    date_updated = bookJson["date_updated"] as int;
    author = bookJson["author"].toString();
    author_name = bookJson["author_name"].toString();
    top_class = bookJson["top_class"].toString();
    state = bookJson["state"].toString();
    readCount = bookJson["readCount"].toString();
    praiseCount = bookJson["praiseCount"].toString();
    stat_name = bookJson["stat_name"].toString();
    category = bookJson["class"].toString();
    category_name = bookJson["class_name"].toString();
    size = bookJson["size"].toString();
    book_cover = bookJson["book_cover"].toString();
    chapterid_first = bookJson["chapterid_first"].toString();
    chargeMode = bookJson["chargeMode"].toString();
    digest = bookJson["digest"].toString();
    price = bookJson["price"].toString();


    List<dynamic> tags= (bookJson["tag"] as List<dynamic>);
    if (tags == null) {
      tag = List<String>();
    } else {
      tag = tags.map<String>((tagItem){
        return "$tagItem";
      }).toList();
    }


    is_new = (bookJson["is_new"] is String) ? 0 : bookJson["is_new"];
    discountNum = bookJson["discountNum"] as int;
    quick_price = bookJson["quick_price"] as int;
    formats = bookJson["formats"].toString();
    audiobook_playCount = bookJson["audiobook_playCount"] as int;
    chapterNum = bookJson["chapterNum"].toString();
    isShortStory = bookJson["isShortStory"] as bool;
    userid = bookJson["userid"].toString();
    search_heat = bookJson["search_heat"] as int;
    num_click = bookJson["num_click"] as int;
    recommend_num = bookJson["recommend_num"].toString();
    first_cate_id = bookJson["first_cate_id"].toString();
    first_cate_name = bookJson["first_cate_name"].toString();
    reason = bookJson["reason"].toString();
  }

  static List<BookBrief> parseJson(List<Map<String, dynamic>> books) {
    return books.map<BookBrief>((book){
      return BookBrief.fromJson(book);
    }).toList();
  }
}