import 'package:flutter/material.dart';

class JournalDrawer extends StatefulWidget {
  final setTheme;
  final state;
  JournalDrawer({Key key, this.setTheme, this.state}) : super(key: key);

  @override
  _JournalDrawerState createState() => _JournalDrawerState();
}

class _JournalDrawerState extends State<JournalDrawer> {

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          Container (
            height: 80.0,
            child: DrawerHeader(
              child: Text(
                'Settings',
                style: Theme.of(context).textTheme.headline6
              )
            )
          ),
          SwitchListTile(
            title: const Text('Dark Mode'),
            value: widget.state, 
            onChanged: (value) {
              setState( () {
                widget.setTheme(value);
              });
            }
          )
        ]
      )
    );
  }
}
