import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class StartPage extends StatefulWidget {
  @override
  _StartPageState createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: buildSliverBody(),
    );
  }

  Widget buildSliverBody() {
    return CustomScrollView(
      slivers: <Widget>[
        SliverAppBar(
          leading: Icon(Icons.menu),
          floating: true,
          snap: true,
          expandedHeight: 150.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              children: <Widget>[
                SizedBox(height: 90.0),
                Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                      child: Container(
                        height: 36.0,
                        width: 350.0,
                        child: CupertinoTextField(
                          keyboardType: TextInputType.text,
                          placeholder: 'Search ...',
                          placeholderStyle: TextStyle(
                            color: Color(0xffC4C6CC),
                            fontSize: 14.0,
                            fontFamily: 'Brutal',
                          ),
                          prefix: Padding(
                            padding: const EdgeInsets.fromLTRB(9.0, 6.0, 9.0, 6.0),
                            child: Icon(
                              Icons.search,
                              color: Color(0xffC4C6CC),
                            ),
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: Color(0xffF0F1F5),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(16.0, 6.0, 16.0, 16.0),
                      child: Icon(Icons.shopping_cart, color: Colors.white, size: 36.0,),
                    )
                  ],
                ),
              ],
            ),
          ),
          actions: <Widget>[
            Padding(
              padding: const EdgeInsets.only(right: 35.0),
              child: Row(
                children: <Widget>[
                  Text('Game Controller'),
                  SizedBox(width: 10,),
                  Text('VR Accessories'),
                  SizedBox(width: 10,),
                  Text('Media Remotes'),
                ],
              ),
            ),
          ],
        ),

        SliverList(
          delegate: SliverChildBuilderDelegate((_, i) {
            return ListTile(title: Text("Item $i"));
          }, childCount: 20),
        ),
//        SliverList(
//          delegate: SliverChildListDelegate([
//            ListTile(
//              leading: Icon(Icons.volume_off),
//              title: Text("Volume Off"),
//            ),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_mute), title: Text("Volume Mute")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//            ListTile(
//                leading: Icon(Icons.volume_down), title: Text("Volume Down")),
//          ]),
//        )
      ],
    );
  }
}
