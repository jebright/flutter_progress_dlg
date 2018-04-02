import 'package:flutter/material.dart';
import 'settings.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Progress Indicator Demo',
      theme: new ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: new MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Progress Indicator Demo"),
          backgroundColor: Colors.deepOrangeAccent,
        ),
        drawer: new Drawer(
          child: new ListView(
            children: <Widget>[
              new ListTile(
                title: new Text("WELCOME"),
              ),
              new Divider(),
              new ListTile(
                  title: new Text("Settings"),
                  trailing: new Icon(Icons.settings),
                  onTap: () {
                    Navigator.of(context).pop();
                    Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => new SettingsPage()));
                  }),
            ],
          ),
        ),
        body: new Center(
          child: new Text("Home Page", style: new TextStyle(fontSize: 35.0)),
        ));
  }
}
