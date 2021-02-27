import 'package:flutter/material.dart';
import 'screens/entry_details_screen.dart';
import 'screens/journal_entries_screen.dart';
import 'screens/new_entry_screen.dart';

class App extends StatelessWidget {
  
  static final routes = {
    JournalEntries.routeName: (context) => JournalEntries(),
    NewEntry.routeName: (context) => NewEntry(),
    EntryDetails.routeName: (context) => EntryDetails()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      initialRoute: JournalEntries.routeName,
      routes: routes
    );
  }
}