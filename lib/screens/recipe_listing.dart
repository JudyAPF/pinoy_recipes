import 'package:pinoy_recipes/components/recipe_tile.dart';
import 'package:pinoy_recipes/data/back_data.dart';
import 'package:pinoy_recipes/models/category.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecipeListingScreen extends StatelessWidget {
  RecipeListingScreen({super.key, required this.category});

  Category category;
  var recipeList = [];

  @override
  Widget build(BuildContext context) {
    recipeList =
        RECIPES.where((recipe) => recipe.categoryId == category.id).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("${category.name} Recipes"),
        centerTitle: true,
        backgroundColor: category.color,
      ),
      body: ListView.builder(
          itemCount: recipeList.length,
          itemBuilder: (_, index) {
            return RecipeTile(recipeList[index], category);
          }),
    );
  }
}