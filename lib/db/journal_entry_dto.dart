class JournalEntryDTO {
  String title;
  String body;
  int rating;
  DateTime dateTime;
  String toString() {
    return 'Title: $title, Body: $body, Rating: $rating, Date: $dateTime';
  }
}