import 'package:flutter/material.dart';
import 'package:journal/screens/entries_list_screen.dart';
import '../widgets/entry_form.dart';

class NewEntryScreen extends StatelessWidget {
  
  static const routeName = 'newEntry';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('New Entry'),
      ),
      body: EntryForm()
    );
  }
}