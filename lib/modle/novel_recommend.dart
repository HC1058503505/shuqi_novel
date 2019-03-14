class NovelRecommend {
//  "author_name": "北城",
//  "bookname": "超级女神的护花高手",
//  "bookid": "7060196",
//  "authorid": "93971",
//  "book_cover": "http:\/\/img-tailor.11222.cn\/bcv\/big\/201801171631281432.jpg",
//  "tags": "爽文,学生,异术超能",
//  "category": "都市异能"

  String author_name;
  String bookname;
  String bookid;
  String authorid;
  String book_cover;
  String tags;
  String category;

  NovelRecommend.fromJson(Map<String, dynamic> recommend) {
    author_name = recommend["author_name"] as String;
    bookname = recommend["bookname"] as String;
    bookid = recommend["bookid"] as String;
    authorid = recommend["authorid"] as String;
    book_cover = recommend["book_cover"] as String;
    tags = recommend["tags"] as String;
    category = recommend["category"] as String;
  }

  static List<NovelRecommend> parseJsonList(List<dynamic> recommends) {
    return recommends.map<NovelRecommend>((recommend) {
      return NovelRecommend.fromJson(recommend);
    }).toList();
  }
}
