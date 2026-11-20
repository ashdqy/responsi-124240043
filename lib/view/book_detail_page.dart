import 'package:flutter/material.dart';
import '../model/book.dart';

class BookDetailPage extends StatelessWidget {
  const BookDetailPage({super.key, required this.book});

  final Book book;

  Widget _item(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(top: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(label, style: TextStyle(fontSize: 12, color: Colors.grey[600])),
          Text(value.isEmpty ? '-' : value, style: const TextStyle(fontSize: 16)),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(child: Image.network(book.cover)),
              //_item('Number', book.number),
              _item('Title', book.title),
              _item('Original Title', book.originalTitle),
              _item('Release Date', book.releaseDate),
              _item('Description', book.description),
             _item('pages', book.pages),
              _item('Index', book.index.toString()),

            ],
          ),
        ),
      ),
    );
  }
}