import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/book_controller.dart';
import '../service/auth_service.dart';
import '../view/book_detail_page.dart';
import '../view/spell_page.dart';

class BookPage extends StatelessWidget {
  BookPage({super.key});
  final BookController controller = Get.put(BookController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Book'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: AuthService.logout,
          ),
        ],
      ),
      body: Obx(() {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return ListView.builder(
          itemCount: controller.books.length,
          itemBuilder: (context, index) {
            final book = controller.books[index];
            return Card(
              child: ListTile(
                leading: SizedBox(
                  width: 40,
                  child: Image.network(book.cover, fit: BoxFit.cover),
                ),
                title: Text(book.title),
                subtitle: Text(book.releaseDate),
                onTap: () {
                  Get.to(() => BookDetailPage(book: book));
                },
              ),
            );
          },
        );
      }),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () => Get.off(() => SpellPage()),
            child: const Text('Spells'),
          ),
        ),
      ),
    );
  }
}