import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:sms/sms.dart';

class MyInbox extends StatefulWidget {
  @override
  State createState() {
    return MyInboxState();
  }
}

class MyInboxState extends State {
  SmsQuery query = new SmsQuery();
  List messages = new List();
  int _bottomIxd = 0;

  @override
  initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    print("Total SMS = " + messages.length.toString());

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
                  value: timeDilation != 0.5,
                  subtitle: Text(
                    'isi sms ' + messages[index].body,
                    maxLines: 4,
                    style: TextStyle(),
                  ),
                  onChanged: (bool value) {
                    setState(() {
                      timeDilation = value ? 1.0 : 0.5;
                    });
                  },
                  secondary: const Icon(Icons.toggle_off),
                ),
              );
            },
          );
        },
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            _bottomIxd = value;
          });
        },
        currentIndex: _bottomIxd,
        items: [
          BottomNavigationBarItem(icon: new Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
              icon: new Icon(Icons.message), label: 'Message'),
          BottomNavigationBarItem(
              icon: DropdownButtonHideUnderline(
                child: DropdownButton(

                  iconSize: 30.0,
                  icon: Icon(Icons.report),
                  items: [
                    DropdownMenuItem(
                      child: Icon(Icons.report),
                      value: 1,
                    ),
                    DropdownMenuItem(
                      child: Icon(Icons.share),
                      value: 2,
                    ),
                  ],
                  onChanged: (value) {},
                ),
              ),
              label: 'Report',

          ),
        ],
      ),
    );
  }

  fetchSMS() async {
    messages = await query.getAllSms;
  }
}

class MultiCheckBoxField extends StatelessWidget {
  const MultiCheckBoxField({
    Key key,
    this.count = 1,
    this.onSaved,
  }) : super(key: key);

  final int count;
  final FormFieldSetter<List<bool>> onSaved;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FormField<List<bool>>(
        initialValue: List.filled(count, false),
        onSaved: onSaved,
        builder: (FormFieldState field) {
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: List.generate(
              count,
              (int index) {
                return Checkbox(
                  onChanged: (bool value) {
                    field.value[index] = value;
                    field.didChange(field.value);
                  },
                  value: field.value[index],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
