import 'package:flutter/material.dart';
import '../widgets/entry_form.dart';
import '../widgets/journal_scaffold.dart';

class NewEntryScreen extends StatefulWidget {
  static const routeName = 'newEntry';
  final setTheme;
  final state;

  NewEntryScreen({Key key, this.setTheme, this.state}) : super(key: key);

  @override
  _NewEntryScreenState createState() => _NewEntryScreenState();
}

class _NewEntryScreenState extends State<NewEntryScreen> {
  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: 'New Entry',
      setTheme: widget.setTheme,
      state: widget.state, 
      body: EntryForm()
    );
  }
}
