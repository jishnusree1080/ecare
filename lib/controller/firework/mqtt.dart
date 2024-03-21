
import 'dart:convert';
import 'dart:async';
import 'dart:io';
//import 'dart:io';

//import 'package:get/get.dart';
import 'package:mqtt_client/mqtt_client.dart';
import 'package:mqtt_client/mqtt_server_client.dart';


import 'dart:math';
// import '../../../models/product_model.dart';
// import '../../../models/resources.dart';
import 'PowerQuery.dart';

enum MqttCurrentConnectionState {
  IDLE,
  CONNECTING,
  CONNECTED,
  DISCONNECTED,
  ERROR_WHEN_CONNECTING
}

enum MqttSubscriptionState {
  IDLE,
  SUBSCRIBED
}

class MqttAdapter extends Adapter {
  int reconnectInterval = 2; // seconds
  Timer? reconnectTimer;
  final key = "instance/${100000000 + Random().nextInt(900000)}/user/app/unit/business/organization/:";
final MqttServerClient client = MqttServerClient('13.201.65.73', 'fhd_new_tr '+"${1000000+Random().nextInt(9000000)}");
  final topic = 'PQ313';
  //bool isSwitched = false;
  var pongCount = 0;
  bool init=true;

  //late String status;

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;


  MqttAdapter(super.listener);
  @override
  Future<void> start() async {
    client.port = 61616; //(or WS port )
    client.keepAlivePeriod = 20; // Keep-alive interval in seconds
    client.onConnected = onConnected;
    client.onDisconnected = onDisconnected;
    //client.onSubscribed = onSubscribed(topic);
    client.autoReconnect = true;

    // client.autoReconnect=true;
    client.logging(on: true);

    const username = 'ecare';
    const password = 'aalbot123';
    final connMess = MqttConnectMessage()
        .authenticateAs(username, password);
    print('MqttAdapter:start => Mqtt client connecting....');
    client.connectionMessage = connMess;
    _connectToBroker();



  }
  void _connectToBroker() async {
    try {
      await client.connect();
      print('intial connection established`:........................................ $e');

      client.updates!.listen((List<MqttReceivedMessage<MqttMessage?>>? c) {
        final recMess = c![0].payload as MqttPublishMessage;
        final pt =
        MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
        print('MQTTAdapter::Message received on topic: <${c[0].topic}> is $pt\n');
        print('MQTTAdapter::Message received on payload: <${c[0].payload}> is $pt\n');
        print('MQTTAdapter::Message received on recMess: <$recMess> \n');
        //MQTTClientWrapperAdapter warp =MQTTClientWrapperAdapter(listener);
       checkTopic(c[0].topic,pt);
      });
    }catch (e) {
      print('Exception caughted:........................................ $e');
    }
  }
  void checkTopic(String topic, String message) {
    print("tttttt eeeelement ${topic.split("/")[1]}");
    if (topic.split("/")[1] == "UPDATE") {
      print("in IF statement $topic");
      print("message is from condition if: $message, topic is $topic");
      client.subscribe("QP313/UPDATE/#", MqttQos.atMostOnce);
    }
    client.unsubscribe(topic);
    listener.onReceiveStream(topic,message);
    print("message is from condition else: $message, topic is $topic");
  }



  void onConnected() {
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print("connected sucessfully.........................................................");

      //TODO fetching immediately
      // if(init) {
      //   ProductController p = Get.put(ProductController());
      //   p.call(listener);
      //   init=false;
      // }
    }
  }
  void onDisconnected() {
    print(' Client disconnected................................');
  }
  void onReconnect(){
    print("autoreconecting........................");
  }
  void pong() {
    print('Ping response client callback invoked');
    pongCount++;
  }

  void _publishMessage(String message, value) {
    print("_publish massage is ..................$message");
    final mqttMessage = MqttClientPayloadBuilder();
    mqttMessage.addString(value);
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print("mqttAdapter:  _publishMessage => MqttConnectionState : Active.. & ready to publish");
      client.publishMessage(message, MqttQos.exactlyOnce, mqttMessage.payload!);
    }
    else
    {
      print("mqttAdapter:  _publishMessage => MqttConnection Failier... , denied publishing....... ");
      // client.publishMessage(message, MqttQos.exactlyOnce, mqttMessage.payload!);
    }
  }
  @override
  write(event, value) async {
    print("mqtt write send..... $event");
    var to = "PQ313/WRITE/$key/$event";
    var from = "QP313/WRITE/$key/$event";
    print("ghghghgagahaghahhaghaghaghhhshshhahjhjhkhxh$to");
    print("ghghghggaaaaaaaaaaaaahhhhhhhhhhhhggggggggg$from");
    value = value.toString();
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to,value);
  }
  @override
  read(event) async {
    var to = "PQ313/READ/$key/$event";
    var from = "QP313/READ/$key/$event";
    print("mqtt read send.... $event");
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to, event);
  }

  @override
  Future<void> update(event) async {
    print("mqtt read send.... $event");
    var to = "PQ313/UPDATE/$key/$event";
    var from = "QP313/UPDATE/$key/$event";
    print("mqtt: UPDATE => topic $from");
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to, event);
  }
  @override
  Future<void> addHook(to, from) async {
    client.subscribe(from, MqttQos.atMostOnce);
  }
  @override
  Future<void> removeHook(to, from) async {
    client.unsubscribe(from);
  }
  @override
  Future<void> end() async {
    client.disconnect();
  }
}



class MQTTClientWrapperAdapter extends Adapter{
  final key = "instance/${100000000 + Random().nextInt(900000)}/user/app/unit/business/organization/:";
  final topic = 'PQ313/#';
  bool init=true;

  late MqttServerClient client;

  MqttCurrentConnectionState connectionState = MqttCurrentConnectionState.IDLE;
  MqttSubscriptionState subscriptionState = MqttSubscriptionState.IDLE;

  MQTTClientWrapperAdapter(super.listener);

  // using async tasks, so the connection won't hinder the code flow
  void start() async {
    _setupMqttClient();
    await _connectClient();

  }

  // waiting for the connection, if an error occurs, print it and disconnect
  Future<void> _connectClient() async {
    try {
      print('client connecting....');
      connectionState = MqttCurrentConnectionState.CONNECTING;
      await client.connect('ecare', 'aalbot123');
    } on Exception catch (e) {
      print('client exception - $e');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }

    // when connected, print a confirmation, else print an error
    if (client.connectionStatus?.state == MqttConnectionState.connected) {
      connectionState = MqttCurrentConnectionState.CONNECTED;
      print('client connected');

      _setupCallback();
    } else {
      print(
          'ERROR client connection failed - disconnecting, status is ${client.connectionStatus}');
      connectionState = MqttCurrentConnectionState.ERROR_WHEN_CONNECTING;
      client.disconnect();
    }
  }

  void _setupMqttClient() {
    client = MqttServerClient.withPort('65.2.142.6', 'aalbotggg', 8883);
    // the next 2 lines are necessary to connect with tls, which is used by HiveMQ Cloud
    client.secure = true;
    client.autoReconnect=true;
    client.securityContext = SecurityContext.defaultContext;
    client.keepAlivePeriod = 20;
    client.onDisconnected = _onDisconnected;
    client.onConnected = _onConnected;
    client.onSubscribed = _onSubscribed;
  }

  void _setupCallback() {


    // print the message when it is received
    client.updates?.listen((List<MqttReceivedMessage<MqttMessage>> c) {
      final recMess = c![0].payload as MqttPublishMessage;
      final pt =
      MqttPublishPayload.bytesToStringAsString(recMess.payload.message);
      print('MQTTAdapter::Message received on topic: <${c[0].topic}> is $pt\n');
      print('MQTTAdapter::Message received on payload: <${c[0].payload}> is $pt\n');
      print('MQTTAdapter::Message received on recMess: <$recMess> \n');
      checkTopic(c[0].topic,pt);
    });
  }

  void checkTopic(String topic, String message) {
    print("tttttt eeeelement ${topic.split("/")[1]}");
    if (topic.split("/")[1] == "UPDATE") {
      print("in IF statement $topic");
      print("message is from condition if: $message, topic is $topic");
      client.subscribe("QP313/UPDATE/#", MqttQos.atMostOnce);
    }
    client.unsubscribe(topic);
    listener.onReceiveStream(topic,message);
    print("message is from condition else: $message, topic is $topic");
  }
  void _publishMessage(String message, value) {
    print("_publish massage is ..................$message");
    final mqttMessage = MqttClientPayloadBuilder();
    mqttMessage.addString(value);
    if (client.connectionStatus!.state == MqttConnectionState.connected) {
      print("mqttAdapter:  _publishMessage => MqttConnectionState : Active.. & ready to publish");
      client.publishMessage(message, MqttQos.exactlyOnce, mqttMessage.payload!);
    }
    else {
      print("mqttAdapter:  _publishMessage => MqttConnection Failier... , denied publishing....... ");
      // client.publishMessage(message, MqttQos.exactlyOnce, mqttMessage.payload!);
    }
  }
  // callbacks for different events
  void _onSubscribed(String topic) {
    print('Subscription confirmed for topic $topic');
    subscriptionState = MqttSubscriptionState.SUBSCRIBED;
  }

  void _onDisconnected() {
    print('OnDisconnected client callback - Client disconnection');
    connectionState = MqttCurrentConnectionState.DISCONNECTED;
  }

  void _onConnected() {
    connectionState = MqttCurrentConnectionState.CONNECTED;
    print('OnConnected client callback - Client connection was sucessful');

    //TODO fetching immediately
    // if(init) {
    //   ProductController p = Get.put(ProductController());
    //   p.call(listener);
    //   init=false;
    // }
  }

  @override
  write(event, value) async {
    print("mqtt write send..... $event");
    var to = "PQ313/WRITE/$key/$event";
    var from = "QP313/WRITE/$key/$event";
    print("ghghghgagahaghahhaghaghaghhhshshhahjhjhkhxh$to");
    print("ghghghggaaaaaaaaaaaaahhhhhhhhhhhhggggggggg$from");
    value = value.toString();
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to,value);
  }
  @override
  read(event) async {
    var to = "PQ313/READ/$key/$event";
    var from = "QP313/READ/$key/$event";
    print("mqtt read send.... $event");
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to, event);
  }

  @override
  Future<void> update(event) async {
    print("mqtt read send.... $event");
    var to = "PQ313/UPDATE/$key/$event";
    var from = "QP313/UPDATE/$key/$event";
    print("mqtt: UPDATE => topic $from");
    client.subscribe(from, MqttQos.exactlyOnce);
    _publishMessage(to, event);
  }
  @override
  Future<void> addHook(to, from) async {
    client.subscribe(from, MqttQos.atMostOnce);
  }
  @override
  Future<void> removeHook(to, from) async {
    client.unsubscribe(from);
  }
  @override
  Future<void> end() async {
    client.disconnect();
  }

}