import 'package:flutter/material.dart';
import '../widgets/entry_form.dart';
import '../widgets/journal_scaffold.dart';

class NewEntryScreen extends StatelessWidget {
  
  static const routeName = 'newEntry';
  
  @override
  Widget build(BuildContext context) {
    return JournalScaffold(
      title: 'New Entry', 
      body: EntryForm()
    );
  }
}