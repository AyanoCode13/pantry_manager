import 'package:floor/floor.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';

const _indices = [
  Index(value:  ['id'], unique: true),
  Index(value:  ['name'], unique: true)
];

const _primaryKeys = ['id'];

@Entity(tableName: 'products', primaryKeys: _primaryKeys, indices: _indices)
class ProductModel extends ProductEntity {
  const ProductModel({required super.id, required super.name});
}