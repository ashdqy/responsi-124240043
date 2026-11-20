import 'package:flutter/material.dart';

import '../model/book.dart';
import '../service/api_service.dart';

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
          Text(
            value.isEmpty ? '-' : value,
            style: const TextStyle(fontSize: 16),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(book.title)),
      body: SingleChildScrollView(
        child: FutureBuilder<Book>(
          future: ApiService().fetchBookDetail(book.index),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(child: Text('${snapshot.error}'));
            }
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data!;
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: Image.network(data.cover)),
                  _item('Number', data.number.toString()),
                  _item('Title', data.title),
                  _item('Original Title', data.originalTitle),
                  _item('Release Date', data.releaseDate),
                  _item('Description', data.description),
                  _item('Pages', data.pages.toString()),
                  _item('Index', data.index.toString()),
                ],
              ),
            ),
          );
        },
      ),
    ),
    );
  }
}
