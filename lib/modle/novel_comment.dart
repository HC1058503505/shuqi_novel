class CommentReplyInfo {
  String repliedNickName;
  String mid;
  String text;
  String type;
  String nickName;
  String repliedText;

  CommentReplyInfo.fromJson(Map<String, dynamic> replyInfo) {
    repliedNickName = replyInfo["repliedNickName"] as String;
    mid = replyInfo["mid"] as String;
    text = replyInfo["text"] as String;
    type = replyInfo["type"] as String;
    nickName = replyInfo["nickName"] as String;
    repliedText = replyInfo["repliedText"] as String;
  }
}

class NovelComment {
//  "mid": "a46b796c3b4911e8abbc6c92bf28e005",
//  "textType": "0",
//  "isJing": 1,
//  "isTop": 1,
//  "isAuthor": 0,
//  "status": "online",
//  "statusOrigin": 14,
//  "bookName": "逆天神医",
//  "authorName": "月亮不发光",
//  "bookId": "6900908",
//  "authorId": "2914205",
//  "score": 5,
//  "uid": "926636390",
//  "nickName": "大爷",
//  "userPhoto": "https://tfs.alipayobjects.com/images/partner/T1Lh8fXaXuXXXXXXXX",
//  "zanNum": "6358",
//  "pubTime": "1523204811",
//  "replyNum": "135",
//  "rootUid": "0",
//  "existShenReply": 1,
//  "replyInfo": {
//    "repliedNickName": "大爷",
//    "mid": "746be2b047ce11e8abc06c92bf28e013",
//    "text": "确实是换了作者的",
//    "type": "2",
//    "nickName": "书友953662548",
//    "repliedText": "神思悠远，故事线拉的极长，但是却又合情合理。由远入深，从现代拉回修真世界，最为精彩的点莫过于这个了。追了那么久，之前觉得不怎么样，后面文笔爆发的简直妙，感觉像是换了个作者似的"
//  },
//  "summary": "",
//  "text": "神思悠远，故事线拉的极长，但是却又合情合理。由远入深，从现代拉回修真世界，最为精彩的点莫过于这个了。追了那么久，之前觉得不怎么样，后面文笔爆发的简直妙，感觉像是换了个作者似的",
//  "auditStatus": 0,
//  "btype": "1"

  String mid;
  String textType;
  int isJing;
  int isTop;
  int isAuthor;
  String status;
  int statusOrigin;
  String bookName;
  String authorName;
  String bookId;
  String authorId;
  int score;
  String uid;
  String nickName;
  String userPhoto;
  String zanNum;
  String pubTime;
  String replyNum;
  String rootUid;
  int existShenReply;
  CommentReplyInfo replyInfo;
  String summary;
  String text;
  int auditStatus;
  String btype;

  NovelComment.fromJson(Map<String, dynamic> comment) {
    mid = comment["mid"] as String;
    textType = comment["textType"] as String;
    isJing = comment["isJing"] as int;
    isTop = comment["isTop"] as int;
    isAuthor = comment["isAuthor"] as int;
    status = comment["status"] as String;
    statusOrigin = comment["statusOrigin"] as int;
    bookName = comment["bookName"] as String;
    authorName = comment["authorName"] as String;
    bookId = comment["bookId"] as String;
    authorId = comment["authorId"] as String;
    score = comment["score"] as int;
    uid = comment["uid"] as String;
    nickName = comment["nickName"] as String;
    userPhoto = comment["userPhoto"] as String;
    zanNum = comment["zanNum"] as String;
    pubTime = comment["pubTime"] as String;
    replyNum = comment["replyNum"] as String;
    rootUid = comment["rootUid"] as String;
    existShenReply = comment["existShenReply"] as int;
    replyInfo = CommentReplyInfo.fromJson(comment["replyInfo"]);
    summary = comment["summary"] as String;
    text = comment["text"] as String;
    auditStatus = comment["auditStatus"] as int;
    btype = comment["btype"] as String;
  }

  static List<NovelComment> parseJsonList(List<dynamic> comments) {
    return comments.map<NovelComment>((comment) {
      return NovelComment.fromJson(comment);
    }).toList();
  }
}
