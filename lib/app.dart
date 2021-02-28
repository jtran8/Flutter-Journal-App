import 'package:flutter/material.dart';
import 'screens/entry_details_screen.dart';
import 'screens/entries_list_screen.dart';
import 'screens/new_entry_screen.dart';

class App extends StatelessWidget {
  
  static final routes = {
    EntriesList.routeName: (context) => EntriesList(),
    NewEntry.routeName: (context) => NewEntry(),
    EntryDetails.routeName: (context) => EntryDetails()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      initialRoute: EntriesList.routeName,
      routes: routes
    );
  }
}