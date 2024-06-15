// lib/models/item.dart
class Item {
  final String id;
  final String title;
  final String description;
  bool isFavorite;

  Item({
    required this.id,
    required this.title,
    required this.description,
    this.isFavorite = false,
  });
}
