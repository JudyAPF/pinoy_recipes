import 'package:pinoy_recipes/screens/category_listing.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const PinoyRecipesApp());
}
/*
Shows Recipe Categories and Recipe
1) Category (ie Kapampangan,)
2) Category Listing
3) Recipes
4) Recipe Listing
5) View Individual Recipes
*/
class PinoyRecipesApp extends StatelessWidget {
  const PinoyRecipesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CategoryListingScreen(
        
      ),
    );
  }
}