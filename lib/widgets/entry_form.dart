import 'package:flutter/material.dart';
import '../db/database_manager.dart';
import '../db/journal_entry_dto.dart';

// Adapted from Week 07 Exploration 03.1 & Week 08 Exploration 05.1
class EntryForm extends StatefulWidget {
  @override
  _EntryFormState createState() => _EntryFormState();
}

class _EntryFormState extends State<EntryForm> {
  final formKey = GlobalKey<FormState>();
  final entryValues = JournalEntryDTO();
  
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(height: 10),
            titleFormField(),
            SizedBox(height: 20),
            bodyFormField(),
            SizedBox(height: 20),
            ratingFormField(),
            SizedBox(height: 10),
            buttonRow(context)
          ]
        )
      )
    );
  }

  Widget titleFormField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Title', 
        border: OutlineInputBorder()
      ),
      onSaved: (value) {
        entryValues.title = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a Title';
        } else {
          return null;
        }
      }
    );
  }

  Widget bodyFormField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Body', 
        border: OutlineInputBorder()
      ),
      onSaved: (value) {
        entryValues.body = value;
      },
      validator: (value) {
        if (value.isEmpty) {
          return 'Please enter a Body';
        } else {
          return null;
        }
      }
    );
  }

  Widget ratingFormField() {
    return TextFormField(
      autofocus: true,
      decoration: InputDecoration(
        labelText: 'Rating', 
        border: OutlineInputBorder()
      ),
      onSaved: (value) {
        entryValues.rating = int.parse(value);
      },
      validator: (value) {
        if (value != '1' && value != '2' && value != '3' && value != '4') {
          return 'Please enter a Rating from 1 to 4';
        } else {
          return null;
        }
      }
    );
  }

  Widget buttonRow(BuildContext context) {
    return Row (
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        saveButton(context),
        cancelButton(context)
      ],
    );
  }

  Widget cancelButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      child: Text('Cancel')
    );
  }
  
  Widget saveButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        if (formKey.currentState.validate()) {
          formKey.currentState.save();
          addDateToEntry();
          final databaseManager = DatabaseManager.getInstance();
          databaseManager.saveJournalEntry(dto: entryValues);
          Navigator.of(context).pop();
        }
      },
      child: Text('Save')
    );
  }
  
  void addDateToEntry() {
    entryValues.dateTime = DateTime.now();
  }
}
