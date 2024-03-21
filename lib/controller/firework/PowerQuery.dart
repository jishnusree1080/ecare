import 'dart:async';
import 'package:eventify/eventify.dart';

import 'hashQuery.dart';
import 'mqtt.dart';
abstract class Adapter {
  var listener;

  Adapter(this.listener);

  Future<void> read(event);

  Future<void> write(event, dynamic value);

  Future<void> update(event);

  Future<void> addHook( to, from);

  Future<void> removeHook(to, from);

  Future<void> end();
}
abstract class QueryListener {
  Future<void> onReceiveStream(String event,  dynamic data);
  Future<void> onNotifyStatus(String event, String msg);
}
class PowerQuery extends QueryListener {
  final events = EventEmitter();
  late MqttAdapter adapter;
  bool isLive = true;
  PowerQuery() {
    print("PowerQuery:Constructor => creating instance");
    adapter = MqttAdapter(this);
    adapter.start();
  }

  //SELECT/-BLU-/FROM/BOOKS/;
  @override
  Future<void> onReceiveStream(var event, dynamic data) async {
    int p;
    print('for our checking $event');
    var t = event.split('/')[2];
    print('t is our checker 3333 $t');
    if (t == ':') {
      p = 1;
    } else {
      p = 0;
    }
    print('checking value is------- $p');
    final valueChecker = p;
    print('PowerQuery stream.... $event 200');
    if (valueChecker == 0) {
      event = event
          .split(':/',)
          .last;
      print('`````````1122notupdated $valueChecker $event');
      var builtEvent = buildEvent(event);
      print('`````````1122notupdated $builtEvent');
      events.emit(builtEvent as String, 200, data.toString());
    } else {
      event = event
          .split(':')
          .last;
      print('`````````1122updated $valueChecker $event');
      print('PowerQuery stream.... $event 200');
      event = changeformat(event) as String;
      event = event.replaceAll('.', '');
      print('PowerQuery stream.... $event 200');
      events.emit(event, 200, data.toString());
    }
  }

  @override
  Future<void> onNotifyStatus(String event, String msg) async {
    print('PowerQuery notification.... $event $msg');
    switch (event) {
      case 'connect':
      case 'reconnect':
        isLive = msg == null ? false : true;
        break;
      case 'error':
      case 'close':
        isLive = false;
        break;
    }
    print('PowerQuery status.... $isLive');
  }
  Future<void> getStream(query, EventCallback fn) async {
    print('PowerQuery getStream.... $isLive $query');
    final hash = buildhash(query);
    print('PowerQuery getHash.... $hash');
    events.on(hash as String,"update stream",fn);
    await adapter.update(hash);
  }
  Future<void> getStreamOnce(String query, EventCallback fn) async {
    print('PowerQuery getStreamOnce.... $isLive $query');
    final hash = buildhash(query);
    events.on(hash as String,query,fn);
    await adapter.read(hash);
  }
  writeStream(String query, String value, EventCallback fn)  async {
    print('PowerQuery writeStream.... $isLive $query');
    print('powerQuery writestream value is.......$value');
    final hash =  buildhash(query);
    print("hashfuntionvalue.........................is: $hash");
    events.on(hash as String , value, fn);
    adapter.write(hash, value);
  }
  void destroyStream(String query, Function fn) {
    void removeListener(String query, fn) {
      if (fn
          .trim()
          .isEmpty) {
        throw ArgumentError.notNull('eventName');
      }
    }

    // addToCart({required products e}) {
    //   Map<String, dynamic> temp = {
    //     'id': e.id,
    //     'name': e.name,
    //     'category': e.category,
    //     'description': e.description,
    //     'image': e.image,
    //     'quantity': e.quantity,
    //     'price': e.price,
    //   };
    //   FireBaseStoreHelper.fireBaseStoreHelper.cartInsert(data: temp);
    //   notifyListeners();
    // }

    void end() {
      //events.off();
      adapter.end();
    }
  }
}