import 'package:flutter/material.dart';
import 'package:meal_planner/domain/entities/recipe/recipe.entity.dart';
import 'package:meal_planner/ui/viewModels/recipe.viewModel.dart';
import 'package:provider/provider.dart';



final class RecipeList extends StatelessWidget {
  const RecipeList({super.key});

  @override
  Widget build(BuildContext context) {
    final recipes = context.watch<RecipeViewModel>().recipes;
    return SliverList.builder(
      
      itemCount: recipes.length,
      itemBuilder: (context, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: _RecipeListItem(recipe: recipes.elementAt(index))
      ),
    );
  }
}

final class _RecipeListItem extends StatelessWidget {
  final RecipeEntity _recipe;

  const _RecipeListItem({super.key, required RecipeEntity recipe}) : _recipe = recipe;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Container(
        child: Text(_recipe.name),
      )
    );
  }
}