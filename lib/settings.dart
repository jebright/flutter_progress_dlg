import 'package:flutter/material.dart';
import 'dart:async';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => new _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  bool _monitor = true;
  bool _lights = false;
  bool _kitchen = false;
  bool _bedroom = false;
  bool _saving = false;

  void _submit() {
    print('submit called...');

    setState(() {
      _saving = true;
    });

    //Simulate a service call
    print('submitting to backend...');
    new Future.delayed(new Duration(seconds: 4), () {
      setState(() {
        _saving = false;
      });
    });
  }

  List<Widget> _buildForm(BuildContext context) {
    Form form = new Form(
      child: new Column(
        children: [
          new CheckboxListTile(
            title: const Text('Enable Monitoring?'),
            value: _monitor,
            onChanged: (bool value) {
              setState(() {
                _monitor = value;
              });
            },
            secondary: const Icon(Icons.power),
          ),
          new SwitchListTile(
            title: const Text('Lights'),
            value: _lights,
            onChanged: (bool value) {
              setState(() {
                _lights = value;
              });
            },
            secondary: const Icon(Icons.lightbulb_outline),
          ),
          new SwitchListTile(
            title: const Text('Kitchen'),
            value: _kitchen,
            onChanged: (bool value) {
              setState(() {
                _kitchen = value;
              });
            },
            secondary: const Icon(Icons.kitchen),
          ),
          new SwitchListTile(
            title: const Text('Bedroom'),
            value: _bedroom,
            onChanged: (bool value) {
              setState(() {
                _bedroom = value;
              });
            },
            secondary: const Icon(Icons.hotel),
          ),
          new RaisedButton(
            onPressed: _submit,
            child: new Text('Save'),
          ),
        ],
      ),
    );

    var l = new List<Widget>();
    l.add(form);

    if (_saving) {
      var modal = new Stack(
        children: [
          new Opacity(
            opacity: 0.3,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          new Center(
            child: new CircularProgressIndicator(),
          ),
        ],
      );
      l.add(modal);
    }

    return l;
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Settings'),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: new Stack(
        children: _buildForm(context),
      ),
    );
  }
}
