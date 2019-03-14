class Chapter {
  int id; // 719306,
  String title; // 第一章落魄青年,
  int updateTime; // 1479970514,
  String shortContUrlSuffix; // ""

  Chapter.fromJson(Map<String, dynamic> chapter) {
    id = chapter["id"];
    title = chapter["title"];
    updateTime = chapter["updateTime"];
    shortContUrlSuffix = chapter["shortContUrlSuffix"];
  }
}

class DisInfo {
  bool isBuyAll; // false,
  String minDiscount; // 88

  DisInfo.fromJson(Map<String, dynamic> disInfo) {
    isBuyAll = disInfo["isBuyAll"];
    minDiscount = disInfo["minDiscount"];
  }
}

class MiGuInfo {
  MiGuInfo.fromJson(Map<String, dynamic> miguInfo) {}
}

class AudiobookInfo {
  AudiobookInfo.fromJson(Map<String, dynamic> audiobookInfo) {}
}

class FullDirectInfo {
  FullDirectInfo.fromJson(Map<String, dynamic> fullDirectInfo) {}
}

class OriginalInfo {
  OriginalInfo.fromJson(Map<String, dynamic> originalInfo) {}
}

class NovelDetail {
  String bid; // 1945,
  String bookname; // 逆天神医,
  String comment_count; // 486547,
  String
      book_cover; //  http;  ////img-tailor.11222.cn/bcv/big/201901031812421599.jpg,
  String authorId; //  2914205,
  String author_name; //  月亮不发光,
  bool hide; //  false,
  String shelfStatus; // 1,
  bool coverIsOpen; // true,
  bool readIsOpen; // true,
  String stat_name; // 完结,
  bool listIsOpen; // true,
  double wordCount; // 437.29,
  double score; // 4.9,
  String state; // 1,
  String classId; // 122,
  String class_name; // 都市异能,
  String chapterNum; // 2111,
  int lastInsTime; // 1546697715,
  String payMode; // 3,
  String price; // 0.5,
  int first_article_id; // 1000,
  List<String> tag; // [神医,医术,都市生活],
  String
      introduction; // 【年度神作】真正的神医是什么？是会杀人的神医！\r\n杀一人，救百人，杀不杀？\r\n杀！\r\n这是一个不一样的神医；他妙手回春，有人将他的名字刻在长生牌位之上，日夜供奉。\r\n他受人唾骂，有人恨不得将他剥皮抽筋，日夜诅咒。\r\n他左擒济世壶，一手金针渡人苦海；他右持杀生剑，一剑送人断头台。\r\n可救人病，亦可要人命！\r\n,
  Chapter firstChapter;
  Chapter lastChapter;
  int disType; // 3,
  DisInfo disInfo;
  MiGuInfo miguInfo; // {},
  int extraDiscount; // 10,
  int userMonthlyType; // 3,
  int serverTime; // 1546752139,
  String topClass; // 502,
  String shareCoverUrl; // http;  ////d.shuqi.com/1_5doSc,
  String formats; // 1,
  String weekClick; // 228232,
  String recIntro; // 杀人即是救人，这么做到底是对是错，留给世人评说。一个神医的孤独之旅。,
  String similar; // 91%,
  String intro; // ,
  int superVipEndTime; // 0,
  int isSupportVipCoupon; // 1,
  bool oriIsReward; // true,
  String finalPrice; // ,
  AudiobookInfo audiobookInfo;
  int relationBookId; // 0,
  int relationTopclass; // 0,
  int relationAudiobookId; // 0,
  int recommendTicketNum; // 6643,
  int monthTicketNum; // 2325,
  int rewardNum; // 211452,
  int rewardRank; // 0,
  int recommendTicketRank; // 0,
  int monthTicketRank; // 3,
  String cpName; // 原创版权,
  String cpId; // 10091,
  FullDirectInfo fullDirectInfo; // {},
  int monthlyEnd; // 0,
  int limitFreeEnd; // 0,
  int isOriginBook; // 2,
  OriginalInfo originalInfo; // {},
  String
      shortContUrlPrefix; // http;  ////content.shuqireader.com/sapi/chapter/contentshort/,
  String numClick; // 228232,
  String readFeatureOpt; // 0,
  bool isBuy; // false,
  bool isReward; // true,
  bool isMonthlyBook; // false,
  bool isSupportRecommendTicket; // true,
  bool isSupportMonthTicket; // true

  NovelDetail() {}

  NovelDetail.fromJson(Map<String, dynamic> novel) {
    bid = novel["bid"].toString();
    bookname = novel["bookname"].toString();
    comment_count = novel["comment_count"].toString();
    book_cover = novel["book_cover"].toString();
    authorId = novel["authorId"].toString();
    author_name = novel["author_name"].toString();
    hide = novel["hide"] as bool;
    shelfStatus = novel["shelfStatus"].toString();
    coverIsOpen = novel["coverIsOpen"] as bool;
    readIsOpen = novel["readIsOpen"] as bool;
    stat_name = novel["stat_name"].toString();
    listIsOpen = novel["listIsOpen"] as bool; // true,
    wordCount = novel["wordCount"] as double; // 437.29,
    score = novel["score"] as double; // 4.9,
    state = novel["state"].toString(); // 1,
    classId = novel["classId"].toString(); // 122,
    class_name = novel["class_name"].toString(); // 都市异能,
    chapterNum = novel["chapterNum"].toString(); // 2111,
    lastInsTime = novel["lastInsTime"] as int; // 1546697715,
    payMode = novel["payMode"].toString(); // 3,
    price = novel["price"].toString(); // 0.5,
    first_article_id = novel["first_article_id"] as int; // 1000,

    List<dynamic> tags = novel["tag"] as List<dynamic>;
    tag = tags.map<String>((tagItem) {
      return "$tagItem";
    }).toList(); // [神医,医术,都市生活],

    introduction = novel["introduction"]
        .toString(); // 【年度神作】真正的神医是什么？是会杀人的神医！\r\n杀一人，救百人，杀不杀？\r\n杀！\r\n这是一个不一样的神医；他妙手回春，有人将他的名字刻在长生牌位之上，日夜供奉。\r\n他受人唾骂，有人恨不得将他剥皮抽筋，日夜诅咒。\r\n他左擒济世壶，一手金针渡人苦海；他右持杀生剑，一剑送人断头台。\r\n可救人病，亦可要人命！\r\n,
    firstChapter = Chapter.fromJson(novel["firstChapter"]);
    lastChapter = Chapter.fromJson(novel["lastChapter"]);
    disType = novel["disType"] as int; // 3,
    disInfo = DisInfo.fromJson(novel["disInfo"]);
    miguInfo = MiGuInfo.fromJson(novel["miguInfo"]); // {},
    extraDiscount = novel["extraDiscount"] as int; // 10,
    userMonthlyType = novel["userMonthlyType"] as int; // 3,
    serverTime = novel["serverTime"] as int; // 1546752139,
    topClass = novel["topClass"].toString(); // 502,
    shareCoverUrl =
        novel["shareCoverUrl"].toString(); // http;  ////d.shuqi.com/1_5doSc,
    formats = novel["formats"].toString(); // 1,
    weekClick = novel["weekClick"].toString(); // 228232,
    recIntro =
        novel["recIntro"].toString(); // 杀人即是救人，这么做到底是对是错，留给世人评说。一个神医的孤独之旅。,
    similar = novel["similar"].toString(); // 91%,
    intro = novel["intro"].toString(); // ,
    superVipEndTime = novel["superVipEndTime"] as int; // 0,
    isSupportVipCoupon = novel["isSupportVipCoupon"] as int; // 1,
    oriIsReward = novel["oriIsReward"] as bool; // true,
    finalPrice = novel["finalPrice"].toString(); // ,
    audiobookInfo = AudiobookInfo.fromJson(novel["audiobookInfo"]);
    relationBookId = novel["relationBookId"] as int; // 0,
    relationTopclass = novel["relationTopclass"] as int; // 0,
    relationAudiobookId = novel["relationAudiobookId"] as int; // 0,
    recommendTicketNum = novel["recommendTicketNum"] as int; // 6643,
    monthTicketNum = novel["monthTicketNum"] as int; // 2325,
    rewardNum = novel["rewardNum"] as int; // 211452,
    rewardRank = novel["rewardRank"] as int; // 0,
    recommendTicketRank = novel["recommendTicketRank"] as int; // 0,
    monthTicketRank = novel["monthTicketRank"] as int; // 3,
    cpName = novel["cpName"].toString(); // 原创版权,
    cpId = novel["cpId"].toString(); // 10091,
    fullDirectInfo = FullDirectInfo.fromJson(novel["fullDirectInfo"]); // {},
    monthlyEnd = novel["monthlyEnd"] as int; // 0,
    limitFreeEnd = novel["limitFreeEnd"] as int; // 0,
    isOriginBook = novel["isOriginBook"] as int; // 2,
    originalInfo = OriginalInfo.fromJson(novel["originalInfo"]); // {},
    shortContUrlPrefix = novel["shortContUrlPrefix"]
        .toString(); // http;  ////content.shuqireader.com/sapi/chapter/contentshort/,
    numClick = novel["numClick"].toString(); // 228232,
    readFeatureOpt = novel["readFeatureOpt"].toString(); // 0,
    isBuy = novel["isBuy"] as bool; // false,
    isReward = novel["isReward"] as bool; // true,
    isMonthlyBook = novel["isMonthlyBook"] as bool; // false,
    isSupportRecommendTicket =
        novel["isSupportRecommendTicket"] as bool; // true,
    isSupportMonthTicket = novel["isSupportMonthTicket"] as bool; // true
  }
}
