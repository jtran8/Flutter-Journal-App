// import 'package:flutter/material.dart';
// import 'package:intl/intl.dart';
// import '../models/journal_entry.dart';

// class Entry extends StatelessWidget {

//   JournalEntry({this.entryData});

//   @override
//   Widget build(BuildContext context) {
//     final JournalEntry entryData = ModalRoute.of(context).settings.arguments;
//     final format = DateFormat('EEEE, MMMM d, y');
//     return Padding(
//       padding: const EdgeInsets.all(10),
//       child: Column(
//         children: [
//           Text('${entryData.title}'),
//           Text('${entryData.body}'),
//           Text('Rating: ${entryData.rating}')
//         ]
//       )
//     );
//   }
// }