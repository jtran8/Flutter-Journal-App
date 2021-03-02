import 'package:flutter/material.dart';

class SettingsDrawer extends StatefulWidget {
  
  final state;
  final function;

  SettingsDrawer({Key key, this.state, this.function}) : super(key : key);

  @override
  _SettingsDrawerState createState() => _SettingsDrawerState();
}

class _SettingsDrawerState extends State<SettingsDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Text('Settings'),
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: widget.state, 
            onChanged: (value) {
              widget.function(value);
            }
          )
        ]
      )
    );
  }

}