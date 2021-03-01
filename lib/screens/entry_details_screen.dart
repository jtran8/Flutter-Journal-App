import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/journal_entry.dart';

class EntryDetailsScreen extends StatelessWidget {
  
  static const routeName = 'EntryDetailsScreen';
  
  @override
  Widget build(BuildContext context) {
    final JournalEntry entryData = ModalRoute.of(context).settings.arguments;
    final format = DateFormat('EEEE, MMMM d, y');

    return Scaffold(
      appBar: AppBar(
        title: Text(format.format(entryData.dateTime)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              '${entryData.title}',
              style: Theme.of(context).textTheme.headline6
            ),
            Text('${entryData.body}'),
            Text('Rating: ${entryData.rating}')
          ]
        )
      )
    );
  }
}