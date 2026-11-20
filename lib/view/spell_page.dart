import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/spell_controller.dart';
import '../service/auth_service.dart';
import '../view/book_page.dart';
import 'favorite_page.dart';

class SpellPage extends StatelessWidget {
  SpellPage({super.key});

  final SpellController controller = Get.put(SpellController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Harry Potter Spells Gallery'),
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
          itemCount: controller.spells.length,
          itemBuilder: (context, index) {
            final spell = controller.spells[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.book),
                title: Text(spell.spell),
                subtitle: Text(spell.use),
               
                trailing: Obx(() => IconButton(
                      icon: Icon(
                        Icons.favorite,
                        color: controller.isFavorite(spell)
                            ? Colors.red
                            : Colors.grey[800],
                      ),
                      onPressed: () => controller.toggleFavorite(spell),
                    )),
              ),
            );
          },
        );
      }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Get.to(() => FavoritePage()),
        child: const Icon(Icons.favorite, color: Colors.red),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(8),
        child: SafeArea(
          child: ElevatedButton(
            onPressed: () => Get.off(() => BookPage()),
            child: const Text('Books'),
          ),
        ),
      ),
    );
  }
}