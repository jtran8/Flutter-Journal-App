import 'package:flutter/material.dart';
import 'journal_drawer.dart';

class JournalScaffold extends StatelessWidget {
  final Widget body;
  final title;
  final routeName;

  JournalScaffold({this.body, this.title, this.routeName});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      endDrawer: SettingsDrawer(),
      body: this.body,
      floatingActionButton: addButton(context)
    );
  }

  FloatingActionButton addButton(BuildContext context) {
    if (routeName != null) {
      return FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(this.routeName),
        tooltip: 'Add a journal entry.',
        child: const Icon(Icons.add),
      );
    }
    return null;
  }

}