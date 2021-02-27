import 'package:flutter/material.dart';

class EntryDetails extends StatelessWidget {
  
  static const routeName = 'entryDetails';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Journal Entry'),
      ),
      body: Center(child: Text('This is the single journal entry page.')),
    );
  }
}