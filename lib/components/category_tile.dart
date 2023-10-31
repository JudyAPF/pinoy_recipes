import 'package:pinoy_recipes/models/category.dart';
import 'package:pinoy_recipes/screens/recipe_listing.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CategoryTile extends StatelessWidget {
  CategoryTile({super.key, required this.category});

  Category category;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // ignore: avoid_print
        print(category.name);
        //open new screen
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (_) =>
              RecipeListingScreen(
                category: category,
              ),
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              category.color,
              category.color.withOpacity(0.5),
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(10),
        ),
        padding: const EdgeInsets.all(8),
        child: Text(
          category.name,
          style: const TextStyle(
            fontSize: 23,
            fontWeight: FontWeight.w300,
          ),
        ),
      ),
    );
  }
}