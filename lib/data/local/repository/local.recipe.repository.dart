import 'package:meal_planner/data/local/dao/recipe.dao.dart';
import 'package:meal_planner/data/local/models/recipe.model.dart';
import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/entities/recipe.entity.dart';
import 'package:meal_planner/service/file.storage.service.dart';
import 'package:meal_planner/utils/result.dart';

final class LocalRecipeRepsitory implements Repository<RecipeEntity>{
  final RecipeDAO _recipeDAO;
  final FileStorageService _fileStorageService;

  LocalRecipeRepsitory({required RecipeDAO recipeDAO, required FileStorageService fileStorageService})
    : _recipeDAO = recipeDAO,
      _fileStorageService = fileStorageService;
  
  @override
  Future<Result<void>> add(RecipeEntity input) async {
    // TODO: implement add
    try{
      
      final res = await _recipeDAO.insertRecipe(RecipeModel.fromEntity(input));
      print("Recipe Created");
      return Result.ok(res);
      
    }on Exception catch(e){
      return Result.error(e);
    }
  }
  
  @override
  Future<Result<void>> delete(String id) {
    // TODO: implement delete
    throw UnimplementedError();
  }
  
  @override
  Future<Result<List<RecipeEntity>>> getAll() async {
    // TODO: implement getAll
    try{
      final res = await _recipeDAO.getAll();
      return Result.ok(res.map((e)=>e.toEntity()).toList());
    } on Exception catch(e){
      return Result.error(e);
    }
  }
  
  @override
  Future<Result<RecipeEntity>> getById(String id) {
    // TODO: implement getById
    throw UnimplementedError();
  }
  
  @override
  Future<Result<void>> update(RecipeEntity input) {
    // TODO: implement update
    throw UnimplementedError();
  }


}