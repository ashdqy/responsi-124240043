import 'dart:convert';
import 'package:http/http.dart' as http;
import '../model/book.dart';
import '../model/spell.dart';

class ApiService {
  final String _baseUrl = 'https://potterapi-fedeperin.vercel.app/en';

  Future<List<Book>> fetchbooks() async {
    final response = await http.get(Uri.parse('$_baseUrl/books'));
    final List<dynamic> result = jsonDecode(response.body);
    print(result);
    return result.map((item) => Book.fromJson(item)).toList();
  }

  Future<Book> fetchBookDetail(int index) async {
  final response = await http.get(Uri.parse('$_baseUrl/books?index=$index'));
  final result = jsonDecode(response.body);
  return Book.fromJson(result);
}

  Future<List<Spell>> fetchSpells() async {
    final response = await http.get(Uri.parse('$_baseUrl/spells'));
    final List<dynamic> result = jsonDecode(response.body);
    return result.map((item) => Spell.fromJson(item)).toList();
  }
}