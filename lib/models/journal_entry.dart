// journal_entry: journal entry model class

class JournalEntry {
  String title;
  String body; 
  int rating;
  DateTime dateTime;

  JournalEntry({this.title, this.body, this.rating, this.dateTime});
}
