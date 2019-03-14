import 'package:shuqi_novel/modle/book_brief.dart';
import 'package:shuqi_novel/modle/bookstore_banner.dart';
enum ModuleType {
  banner, // 顶部banner
  execllentBook, // 最好看的书
  execllentPublish, // 出版精品
  execllentCollection, // 精品汇聚
  execllentSpecial, // 精品专场
  thousandLike, // 点击上十万的好书
  everbodySearch, // 大家都在搜
  newBooks, // 新书专区
  original, // 原创作品
  godExhibition, // 大神巡展
  monthVIP // 包月专区
}

class BookStoreModule {
  ModuleType moduleType;
  String id;
  String m_s_name;
  List<dynamic> content;
  int style;

  BookStoreModule.fromJson(Map<String, dynamic> module) {
    id = module["id"];
    m_s_name = module["m_s_name"];
    bool isBanner = false;
    switch(id) {
      case "3426":
        moduleType = ModuleType.banner;
        isBanner = true;
        break;
      case "7589":
        moduleType = ModuleType.execllentBook;
        break;
      case "4610":
        moduleType = ModuleType.execllentPublish;
        break;
      case "7630":
        moduleType = ModuleType.execllentCollection;
        break;
      case "3415":
        moduleType = ModuleType.execllentSpecial;
        break;
      case "3417":
        moduleType = ModuleType.thousandLike;
        break;
      case "3418":
        moduleType = ModuleType.everbodySearch;
        break;
      case "3419":
        moduleType = ModuleType.newBooks;
        break;
      case "3420":
        moduleType = ModuleType.original;
        break;
      case "3439":
        moduleType = ModuleType.godExhibition;
        break;
      case "4208":
        moduleType = ModuleType.monthVIP;
        break;
    }

    content = _contents(isBanner, module);
    style = module["m_s_style"] as int;
  }

  static List<BookStoreModule> parseJson(List<dynamic> modules){

    List<Map<String, dynamic>> mapList = modules.map<Map<String, dynamic>>((module){
      return module as Map<String, dynamic>;
    }).toList();
    return mapList.map<BookStoreModule>((module){
      return BookStoreModule.fromJson(module);
    }).toList();
  }

  List<dynamic> _contents(bool isBanner, Map<String, dynamic> module) {
    if (isBanner) {
      List<dynamic> contentModule = module["content"] as List<dynamic>;
      List<Map<String, dynamic>> moduleItems = contentModule.map<Map<String, dynamic>>((moduleItem){
        return moduleItem as Map<String, dynamic>;
      }).toList();
      return BookStoreBanner.parseJson(moduleItems);
    }

    List<dynamic> contentModule = module["content"] as List<dynamic>;
    List<Map<String, dynamic>> moduleItems = contentModule.map<Map<String, dynamic>>((moduleItem){
      return moduleItem as Map<String, dynamic>;
    }).toList();
    return BookBrief.parseJson(moduleItems);
  }
}