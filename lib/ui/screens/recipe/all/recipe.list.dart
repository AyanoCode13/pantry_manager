import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/config/routing/routes/recipe.routes.dart';
import 'package:meal_planner/domain/entities/recipe.entity.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
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
    return ListTile(
      onTap: () {
        context.read<ProductViewModel>().getById.execute(arg: _recipe.id);
        context.push(RecipeRoutes.view(_recipe));
      },
      
      title: Text.rich(TextSpan(text: "Name: ${_recipe.name}")),
      subtitle: Text.rich(TextSpan(text: "Price: ${_recipe.price}")),
      trailing: IconButton(onPressed: (){
       
      }, icon: Icon(Icons.delete)),
    );
  }
}