import 'package:flutter/material.dart';
import 'package:journal/screens/journal_entries_screen.dart';

class NewEntry extends StatelessWidget {
  
  static const routeName = 'newEntry';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: Center(child: Text('This is the new entry page.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(JournalEntries.routeName),
        tooltip: 'Add a journal entry.',
        child: const Icon(Icons.add),
      ),
    );
  }
}