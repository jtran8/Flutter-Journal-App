import 'package:flutter/material.dart';
import 'new_entry_screen.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';
import '../models/journal.dart';
import "../screens/entry_details_screen.dart";

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
    List<JournalEntry> journalEntries = await databaseManager.journalEntries();
    setState( () {
      journal = Journal(entries: journalEntries);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entries'),
      ),
      body: buildList(context),
      floatingActionButton: addButton(context)
    );
  }

  Widget buildList(BuildContext context) {
    return ListView.builder(itemCount: journal.entries.length, itemBuilder: (context, index) {
      return ListTile(
        title: Text("${journal.entries[index].title}"),
        subtitle: Text('${journal.entries[index].dateTime}')
      );
    });
  }

  Widget welcome() {
    return Column(
      children: [
        Icon(Icons.book_rounded),
        Text("Journal")
      ]
    );
  }

  FloatingActionButton addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(NewEntry.routeName),
      tooltip: 'Add a journal entry.',
      child: const Icon(Icons.add),
    );
  }

}