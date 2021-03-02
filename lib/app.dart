import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/entry_details_screen.dart';
import 'screens/entries_list_screen.dart';
import 'screens/new_entry_screen.dart';

class App extends StatefulWidget {

  final SharedPreferences preferences;
  App({Key key, this.preferences}) : super(key : key);
  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  static final routes = {
    EntriesListScreen.routeName: (context) => EntriesListScreen(),
    NewEntryScreen.routeName: (context) => NewEntryScreen(),
    EntryDetailsScreen.routeName: (context) => EntryDetailsScreen()
  };
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      initialRoute: EntriesListScreen.routeName,
      routes: routes
    );
  }

}