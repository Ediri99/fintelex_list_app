// lib/screens/detail_screen.dart
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/item_provider.dart';


class DetailScreen extends StatelessWidget {
  final String itemId;

  DetailScreen({required this.itemId});

  @override
  Widget build(BuildContext context) {
    final item = Provider.of<ItemProvider>(context).getItemById(itemId);

    return Scaffold(
      appBar: AppBar(
        title: Text(item.title),
        actions: [
          IconButton(
            icon: Icon(
              item.isFavorite ? Icons.favorite : Icons.favorite_border,
              color: item.isFavorite ? Colors.red : null,
            ),
            onPressed: () {
              Provider.of<ItemProvider>(context, listen: false).toggleFavoriteStatus(item.id);
            },
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            SizedBox(height: 16.0),
            Text(item.description),
          ],
        ),
      ),
    );
  }
}
