class Spell {
  final int index;
  final String spell;
  final String use;

  Spell({required this.index, required this.spell, required this.use});

  factory Spell.fromJson(Map<String, dynamic> jsonData) {
    return Spell(
      index: jsonData['index'] ?? 0,
      spell: jsonData['spell'] ?? '',
      use: jsonData['use'] ?? '',
    );
  }

  // dipakai untuk menyimpan ke Hive
  Map<String, dynamic> toMap() {
    return {'index': index, 'spell': spell, 'use': use};
  }
}