import 'package:flutter/material.dart';
import 'new_entry_screen.dart';

class JournalEntries extends StatelessWidget {
  
  static const routeName = '/';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      body: Center(child: Text('This is the journal entries page.')),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.of(context).pushNamed(NewEntry.routeName),
        tooltip: 'Add a journal entry.',
        child: const Icon(Icons.add),
      ),
    );
  }
}