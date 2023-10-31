import 'package:pinoy_recipes/models/category.dart';
import 'package:pinoy_recipes/models/recipe.dart';
import 'package:pinoy_recipes/screens/recipe_view.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RecipeTile extends StatelessWidget {
  RecipeTile(this.recipe, this.category, {super.key});

  Recipe recipe;
  Category category;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: InkWell(
        onTap: () {
          Navigator.push(context, MaterialPageRoute(builder: (_) =>
          RecipeViewScreen(recipe, category),
          ));
        },
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Stack(children: [
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                ),
                child: AspectRatio(
                    aspectRatio: 3 / 2,
                    child: recipe.imageUrl == null
                        ? const Center(child: Text('No Image'))
                        : Image.network(
                            recipe.imageUrl!,
                            fit: BoxFit.cover,
                          )),
              ),
              Positioned(
                right: 10,
                bottom: 10,
                child: Container(
                    color: Colors.black54,
                    child: Text(
                      recipe.name,
                      style: const TextStyle(
                        fontSize: 28,
                        color: Colors.white,
                      ),
                    )),
              ),
            ]),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 5,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.timer),
                  const SizedBox(
                    width: 5,
                  ),
                  Text('${recipe.duration} minute(s)'),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
