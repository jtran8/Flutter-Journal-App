import 'package:flutter/material.dart';
import 'journal_drawer.dart';

class JournalScaffold extends StatelessWidget {
  final body;
  final title;
  final routeName;
  final setTheme;
  final state;

  JournalScaffold({Key key, this.body, this.title, this.routeName, this.setTheme, this.state}) : super (key : key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(this.title),
      ),
      endDrawer: JournalDrawer(setTheme: setTheme, state: state),
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
