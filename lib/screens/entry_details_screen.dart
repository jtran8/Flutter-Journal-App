import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import '../models/journal_entry.dart';
import '../widgets/journal_scaffold.dart';

class EntryDetailsScreen extends StatelessWidget {
  
  static const routeName = 'EntryDetailsScreen';
  
  @override
  Widget build(BuildContext context) {
    final JournalEntry entryData = ModalRoute.of(context).settings.arguments;
    final format = DateFormat('EEEE, MMMM d, y');

    return JournalScaffold(
      title: format.format(entryData.dateTime),
      body: buildDetails(context, entryData)
    );
  }

  Widget buildDetails(BuildContext context, JournalEntry entryData) {
    return Padding(
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
    );
  }

}