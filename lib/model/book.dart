class Book {
  final String title;
  final String originalTitle;
  final String releaseDate;
  final String description;
  final int pages;
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
      title: jsonData['title'] ?? '',
      originalTitle: jsonData['originalTitle'] ?? '',
      releaseDate: jsonData['releaseDate'] ?? '',
      description: jsonData['description'] ?? '',
      pages: jsonData['pages'] ?? 0,
      number: jsonData['number'] ?? 0,
      cover: jsonData['cover'] ?? '',
      index: jsonData['index'] ?? 0,
    );
  }
}

