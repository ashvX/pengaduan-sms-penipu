import 'package:flutter/material.dart';
import 'dart:async';
import 'package:flutter/services.dart';
import 'package:flutter_sms_inbox/flutter_sms_inbox.dart';


class SmsInbox extends StatefulWidget {
  @override
  _SmsInboxState createState() => _SmsInboxState();
}

class _SmsInboxState extends State<SmsInbox> {
  String _platformVersion = 'Unknown';
  String mess = '';

  SmsQuery query = new SmsQuery();


  @override
  void initState() async{
    super.initState();
    initPlatformState();
  }

  // Platform messages are asynchronous, so we initialize in an async method.
  Future<void> initPlatformState() async {
    List<SmsMessage> messages = await query.getAllSms;
    String platformVersion;
    print(messages[1].body);
    // Platform messages may fail, so we use a try/catch PlatformException.
    try {
      platformVersion = await FlutterSmsInbox.platformVersion;
    } on PlatformException {
      platformVersion = 'Failed to get platform version.';
    }

    // If the widget was removed from the tree while the asynchronous platform
    // message was in flight, we want to discard the reply rather than calling
    // setState to update our non-existent appearance.
    if (!mounted) return;

    setState(() {
      _platformVersion = platformVersion;
      mess = messages[2].body;
      print(messages[1].body);
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text('Running on: $_platformVersion\n $mess'),
        ),
      ),
    );
  }

  Future text() async{
    List<SmsMessage> messages = await query.getAllSms;
    return Text(messages[1].body);
  }
}