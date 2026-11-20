class Book {
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final String pages;
  final int number;
  final String cover;
  final int index;

  Book({
    required this.title,
    required this.originalTitle,
    required this.releaseDate,
    required this.description,
    required this.pages,
    required this.number,
    required this.cover,
    required this.index,
  });

  factory Book.fromJson(Map<String, dynamic> jsonData) {
    return Book(
      title: jsonData['Title'] ?? '',
      originalTitle: jsonData['OriginalTitle'] ?? '',
      releaseDate: jsonData['ReleaseDate'] ?? '',
      description: jsonData['Description'] ?? '',
      pages: jsonData['Pages'] ?? [],
      number : int.tryParse(jsonData['Number'] ?? '0') ?? 0,
      cover: jsonData['Cover'] ?? '',
      index: jsonData['index'] ?? 0,
    );
  }
}

