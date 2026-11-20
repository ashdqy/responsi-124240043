import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/spell_controller.dart';

class FavoritePage extends StatelessWidget {
  FavoritePage({super.key});

  // controller sudah didaftarkan di SpellPage
  final SpellController controller = Get.find<SpellController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Favorite Spell')),
      body: Obx(() {
        return ListView.builder(
          itemCount: controller.favorites.length,
          itemBuilder: (context, index) {
            final spell = controller.favorites[index];
            return Card(
              child: ListTile(
                leading: const Icon(Icons.book),
                title: Text(spell.spell),
                subtitle: Text(spell.use),
                trailing: IconButton(
                  icon: const Icon(Icons.delete, color: Colors.red),
                  onPressed: () => controller.removeFavorite(spell),
                ),
              ),
            );
          },
        );
      }),
    );
  }
}