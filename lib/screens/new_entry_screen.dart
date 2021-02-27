import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entries_screen.dart';
import '../widgets/journal_entry_form.dart';

class NewEntry extends StatelessWidget {
  
  static const routeName = 'newEntry';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: JournalEntryForm()
    );
  }
}