import 'package:pinoy_recipes/components/category_tile.dart';
import 'package:pinoy_recipes/data/back_data.dart';
import 'package:flutter/material.dart';

class CategoryListingScreen extends StatelessWidget {
  CategoryListingScreen({super.key});

  final categoryList = CATEGORIES;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pinoy Recipes'),
        centerTitle: true,
        backgroundColor: const Color(0xffdc4405),
      ),
      body: GridView(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          childAspectRatio: 3/2, //cross: main
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        children: categoryList.map((e) => CategoryTile(category: e)).toList(),
      ),
    );
  }
}