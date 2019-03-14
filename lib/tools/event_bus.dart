//import 'package:flutter/material.dart';

typedef void EventCallback(arg);

class EventBus {
  EventBus._init();

  static EventBus singleton = EventBus._init();

  factory EventBus() => singleton;

  // 保存事件
  var _emap = Map<Object, List<EventCallback>>();

  // 添加事件
  void add(eventKey, EventCallback f){
    if (eventKey == null || f == null) return;
    _emap[eventKey] ??= List<EventCallback>();
    _emap[eventKey].add(f);
  }

  void off(eventKey, [EventCallback f]) {
    if(eventKey == null) return;
    var list = _emap[eventKey];
    if (list == null) return;
    if(f == null) {
      _emap[eventKey] = null;
    } else {
      _emap[eventKey].remove(f);
    }
  }

  void emit(eventKey, [arg]) {
    if(eventKey == null) return;
    var list = _emap[eventKey];
    if (list == null) return;
    int len = list.length - 1;
    for(int i = len; i > -1; --i) {
      list[i](arg);
    }
  }
}

//定义一个top-level变量，页面引入该文件后可以直接使用bus
EventBus bus = EventBus();