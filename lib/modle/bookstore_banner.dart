class BookStoreBanner {
  String link_text;
  String link_url;
  String image_url;
  String type;
  String reason;

  BookStoreBanner.fromJson(Map<String, dynamic> banner) {
    link_text = banner["link_text"].toString();
    link_url = banner["link_url"].toString();
    image_url = banner["image_url"].toString();
    type = banner["type"].toString();
    reason = banner["reason"].toString();
  }

  static List<BookStoreBanner> parseJson(List<Map<String, dynamic>> banners){
    return banners.map<BookStoreBanner>((banner){
      return BookStoreBanner.fromJson(banner);
    }).toList();
  }
}



