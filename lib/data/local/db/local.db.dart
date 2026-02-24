import 'package:floor/floor.dart';
import 'package:meal_planner/data/local/dao/product.dao.dart';
import 'package:meal_planner/data/local/models/product.model.dart';
import 'package:sqflite/sqflite.dart' as sqflite;
import 'dart:async';
part 'local.db.g.dart';

const _entities = [ProductModel];

@Database(version: 1, entities: _entities)
abstract class LocalDatabase extends FloorDatabase {
  ProductDAO get productDAO;
  static late LocalDatabase _instance;
  static LocalDatabase get instance => _instance;
  static Future<void> initialize() async{
    _instance = await $FloorLocalDatabase.databaseBuilder('local.db_3').build();
  }
}

