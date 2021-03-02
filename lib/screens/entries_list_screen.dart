import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'new_entry_screen.dart';
import '../db/database_manager.dart';
import '../models/journal_entry.dart';
import '../models/journal.dart';
import '../screens/entry_details_screen.dart';
import '../widgets/journal_scaffold.dart';

class EntriesListScreen extends StatefulWidget {
  static const routeName = '/';
  
  @override
  _EntriesListScreenState createState() => _EntriesListScreenState();  
}

class _EntriesListScreenState extends State<EntriesListScreen> {
  
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
    return JournalScaffold(
      title: 'Journal Entries',
      body: LayoutBuilder(builder: layoutDecider),
      routeName: NewEntryScreen.routeName
    );
  }

  Widget layoutDecider(BuildContext context, BoxConstraints constraints) =>
    constraints.maxWidth < 700 ? buildList(context, verticalLayout) : buildList(context, horizontalLayout);

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

  Widget buildList(BuildContext context, layout) {
    if (journal.entries.isEmpty) {
      return welcome();
    } else {
      final format = DateFormat('EEEE, MMMM d, y');
      return layout(context, format);
    }
  }

  Widget verticalLayout(BuildContext context, DateFormat format) {
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

    Widget horizontalLayout(BuildContext context, DateFormat format) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(child: ListView.builder(
          itemCount: journal.entries.length, itemBuilder: (context, index) {
            return ListTile(
              title: Text('${journal.entries[index].title}'),
              subtitle: Text(format.format(journal.entries[index].dateTime)),
              isThreeLine: true
            );
          }
        )),
        Expanded(child: ListView.builder(
          itemCount: journal.entries.length, itemBuilder: (context, index) {
            return ListTile(
              title: Text('${journal.entries[index].title}'),
              subtitle: Text('${journal.entries[index].body} \nRating: ${journal.entries[index].rating}'),
              isThreeLine: true
            );
          }
        ))
      ],
    );
  }

}
