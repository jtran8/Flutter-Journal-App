import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_entry_screen.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';
import '../models/journal.dart';
import "../screens/entry_details_screen.dart";

class EntriesListScreen extends StatefulWidget {
  static const routeName = '/';
  
  @override
  _EntriesListScreenState createState() => _EntriesListScreenState();  
}

class _EntriesListScreenState extends State<EntriesListScreen> {
  
  Journal journal;

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

  Widget welcome() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Icon(Icons.book_rounded, size: 100),
        Text('Welcome', textAlign: TextAlign.center)
      ]
    );
  }


  Widget buildList(BuildContext context) {
    final format = DateFormat('EEEE, MMMM d, y');
    if (journal.entries.isEmpty) {
      return welcome();
    } else {
      return ListView.builder(itemCount: journal.entries.length, itemBuilder: (context, index) {
        return ListTile(
          title: Text('${journal.entries[index].title}'),
          subtitle: Text(format.format(journal.entries[index].dateTime)),
          onTap: () => Navigator.of(context).pushNamed(
            EntryDetailsScreen.routeName,
            arguments: journal.entries[index]
          )
        );
      });
    }
  }

  FloatingActionButton addButton(BuildContext context) {
    return FloatingActionButton(
      onPressed: () => Navigator.of(context).pushNamed(NewEntryScreen.routeName, arguments: updateList),
      tooltip: 'Add a journal entry.',
      child: const Icon(Icons.add),
    );
  }

  void updateList(entry) {
    journal ??= Journal();
    setState( () {
      journal.addEntryToList(entry);
    });
  }

}
