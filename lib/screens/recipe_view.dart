import 'package:pinoy_recipes/models/category.dart';
import 'package:pinoy_recipes/models/recipe.dart';
import 'package:flutter/material.dart';

class RecipeViewScreen extends StatelessWidget {
  const RecipeViewScreen(this.recipe, this.category, {super.key});

  final Recipe recipe;
  final Category category;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs (Ingredients and Steps)
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: category.color,
          title: Text(
            recipe.name),
        ),
        body: Column(
          children: [
            AspectRatio(
              aspectRatio: 3 / 2,
              child: recipe.imageUrl == null
                  ? const Center(child: Text('No Image'))
                  : Image.network(
                      recipe.imageUrl!,
                      fit: BoxFit.cover,
                    ),
            ),
            TabBar(
              // ignore: unnecessary_null_comparison
              labelColor: category != null ? category.color : Colors.blue,
              unselectedLabelColor: Colors.grey,
              indicatorWeight: 5,
              // ignore: unnecessary_null_comparison
              indicatorColor: category != null ? category.color : Colors.blue,
              tabs: const [
                Tab(
                  icon: Icon(Icons.restaurant),
                  text: 'Ingredients',
                ),
                Tab(
                  icon: Icon(Icons.list),
                  text: 'Steps',
                ),
              ],
            ),
            Expanded(
              child: TabBarView(
                children: [
                  // Ingredients Tab
                  ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        child: Text(
                          'Ingredients',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (recipe.ingredients != null)
                        ...recipe.ingredients!
                            .map((item) => Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10, vertical: 5),
                                  child: Text('• $item'),
                                ))
                            .toList()
                      else
                        const Text('No Ingredients'),
                    ],
                  ),
                  // Steps Tab
                  ListView(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 5),
                        child: Text(
                          'Steps',
                          style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                        ),
                      ),
                      if (recipe.steps != null)
                        ...recipe.steps!
                            .map((item) => Card(
                                  child: Padding(
                                    padding: const EdgeInsets.all(10),
                                    child: Text(item),
                                  ),
                                ))
                            .toList()
                      else
                        const Text('No Recipes'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}