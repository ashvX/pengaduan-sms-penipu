import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sms/sms.dart';

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    // TODO: implement createState
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();
  List messages = new List();
  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        appBar: AppBar(
          title: Text("SMS Inbox"),
          backgroundColor: Colors.pink,
        ),
        body: FutureBuilder(
          future: fetchSMS(),
          builder: (context, snapshot) {
            return ListView.separated(
                separatorBuilder: (context, index) => Divider(
                      color: Colors.black,
                    ),
                itemCount: messages.length,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: CheckboxListTile(
                      // leading: Icon(Icons.markunread,color: Colors.pink,),
                      title: Text(messages[index].address),
                      value: timeDilation != 1.0,
                      subtitle: Text(
                        messages[index].body,
                        maxLines: 4,
                        style: TextStyle(),
                      ),
                    ),
                  );
                });
          },
        ));
  }

  fetchSMS() async {
    messages = await query.getAllSms;
  }
}
