import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'new_entry_screen.dart';

class EntriesList extends StatefulWidget {
  static const routeName = '/';
  
  @override
  _EntriesListState createState() => _EntriesListState();  
}

class _EntriesListState extends State<EntriesList> {
  
  Journal journal;

  @override
  void initState() {
    super.initState();
    loadJournal();
  }

  void loadJournal() async {
    final databaseManager = DatabaseManager.getInstance();
    
  }

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