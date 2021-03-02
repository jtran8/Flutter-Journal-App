import 'journal_entry.dart';

class Journal {

  List<JournalEntry> entries;
  Journal({this.entries});

  void addEntryToList(entry) {
    entries == null ? entries = [entry] : entries.add(entry);
  }

}
