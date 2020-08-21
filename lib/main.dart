import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Retrieve Text Input',
      home: MyCustomForm(),
    );
  }
}

// Define a custom Form widget.
class MyCustomForm extends StatefulWidget {
  @override
  _MyCustomFormState createState() => _MyCustomFormState();
}

// Define a corresponding State class.
// This class holds the data related to the Form.
class _MyCustomFormState extends State<MyCustomForm> {
  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final myController = TextEditingController();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Retrieve Text Input',
          style: TextStyle(color: Colors.red),
        ),
      ),
      body: buildForm(),
      floatingActionButton: FloatingActionButton(
        // When the user presses the button, show an alert dialog containing
        // the text that the user has entered into the text field.
        onPressed: () {
          return showDialog(
            context: context,
            builder: (context) {
              return AlertDialog(
                // Retrieve the text the that user has entered by using the
                // TextEditingController.
                content: Text(myController.text),
              );
            },
          );
        },
        tooltip: 'Show me the value!',
        child: Icon(Icons.text_fields),
      ),
    );
  }

  Widget buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextField(
          controller: myController,
        ),
        boxText,
        Text('Ini text'),
      ],
    );
  }

  Widget boxText = new Flexible(
      child: new Container(
    decoration: new BoxDecoration(
      border: new Border.all(
        color: Colors.cyan[100],
        width: 3.0,
        style: BorderStyle.solid,
      ),
    ),
    margin: new EdgeInsets.all(5.0),
    padding: new EdgeInsets.all(8.0),
    child: new Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        new Text(
          'Text',
          style: null,
        ),
        new Text(
          'Text feature-1',
          style: null,
        ),
        new Flexible(
          child: new TextFormField(
            decoration: const InputDecoration(
              hintText: 'test bentrok dgn CT',
              labelText: 'feature 2 from master',
            ),
            obscureText: true,
          ),
        ),
      ],
    ),
  ));
}
