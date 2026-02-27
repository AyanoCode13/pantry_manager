import 'package:floor/floor.dart';
import 'package:meal_planner/data/local/models/recipe.model.dart';

@dao
abstract class RecipeDAO {
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> insertRecipe(RecipeModel recipe);

  @Query('SELECT * FROM recipes')
  Future<List<RecipeModel>> getAll();
}