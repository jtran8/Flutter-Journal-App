import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'screens/details_screen.dart';
import 'screens/entries_list_screen.dart';
import 'screens/new_entry_screen.dart';

class App extends StatefulWidget {

  final SharedPreferences preferences;
  App({Key key, this.preferences}) : super(key : key);
  
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {

  static const DARK_THEME_KEY = 'dark';
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Journal',
      initialRoute: EntriesListScreen.routeName,
      theme: ThemeData(
        brightness: getTheme()
      ),
      routes: {
        EntriesListScreen.routeName: (context) => EntriesListScreen(setTheme: themer, state: theme),
        NewEntryScreen.routeName: (context) => NewEntryScreen(setTheme: themer, state: theme),
        DetailsScreen.routeName: (context) => DetailsScreen(setTheme: themer, state: theme)
      }
    );
  }

  bool get theme => widget.preferences.getBool(DARK_THEME_KEY) ?? false;

  Brightness getTheme() => theme ? Brightness.dark : Brightness.light;

  void themer(state) {
    setState(() {
      widget.preferences.setBool(DARK_THEME_KEY, state);
    });
  } 

}
