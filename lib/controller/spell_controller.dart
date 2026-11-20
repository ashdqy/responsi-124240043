import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hive_flutter/hive_flutter.dart';
import '../model/spell.dart';
import '../service/api_service.dart';
import '../service/notification_service.dart';

class SpellController extends GetxController {
  final ApiService _apiService = ApiService();
  final Box _box = Hive.box('favorites');

  final RxList<Spell> _spells = <Spell>[].obs;
  final RxList<Spell> _favorites = <Spell>[].obs;
  final RxBool _isLoading = false.obs;

  List<Spell> get spells => _spells;
  List<Spell> get favorites => _favorites;
  bool get isLoading => _isLoading.value;

  @override
  void onInit() {
    _loadFavorites();
    _retrieveData();
    super.onInit();
  }

  Future<void> _retrieveData() async {
    try {
      _isLoading.value = true;
      final data = await _apiService.fetchSpells();
      _spells.assignAll(data);
    } catch (e) {
      Get.log(e.toString());
    } finally {
      _isLoading.value = false;
    }
  }

  // ambil data favorit yang tersimpan di Hive
  void _loadFavorites() {
    final data = _box.values
        .map((item) => Spell.fromJson(Map<String, dynamic>.from(item)))
        .toList();
    _favorites.assignAll(data);
  }

  bool isFavorite(Spell spell) {
    return _favorites.any((item) => item.index == spell.index);
  }

  // tombol favorite di halaman Spells
  void toggleFavorite(Spell spell) {
    if (isFavorite(spell)) {
      _box.delete(spell.index);
      _favorites.removeWhere((item) => item.index == spell.index);
      Get.snackbar(
        'Remove!',
        '${spell.spell} removed from fav list',
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    } else {
      _box.put(spell.index, spell.toMap());
      _favorites.add(spell);
      Get.snackbar(
        'Add!',
        '${spell.spell} successfully added to fav list',
        backgroundColor: Colors.green,
        colorText: Colors.white,
      );
    }
  }

  //tombol hapus di halaman Favorite Spell
  Future<void> removeFavorite(Spell spell) async {
    _box.delete(spell.index);
    _favorites.removeWhere((item) => item.index == spell.index);

    await NotificationService().showInstantNotification(
      title: 'Delete notification',
      body: 'You deleted ${spell.spell} from fav list!',
    );
  }
 }