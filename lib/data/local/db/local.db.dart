import 'dart:async';

import 'package:floor/floor.dart';
import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/data/local/dao/recipe.dao.dart';
import 'package:meal_planner/data/local/models/product.model.dart';
import 'package:meal_planner/data/local/models/recipe.model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;

part 'local.db.g.dart';

const _entities = [ProductModel, RecipeModel];

@Database(version: 1, entities: _entities)
abstract class LocalDatabase extends FloorDatabase {
  ProductDAO get productDAO;
  RecipeDAO get recipeDAO;
  static late LocalDatabase _instance;
  static LocalDatabase get instance => _instance;
  static Future<void> initialize() async{
    _instance = await $FloorLocalDatabase.databaseBuilder('local.db_5').build();
  }
}

