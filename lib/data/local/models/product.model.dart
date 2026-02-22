import 'package:floor/floor.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:uuid/uuid.dart';

const _indices = [
  Index(value:  ['id'], unique: true),
  Index(value:  ['name'], unique: true)
];

const _primaryKeys = ['id'];

@Entity(tableName: 'products', primaryKeys: _primaryKeys, indices: _indices)
final class ProductModel extends ProductEntity {
  final String id;

  const ProductModel({
    required super.name, required this.id
  });

  factory ProductModel.fromEntity(ProductEntity entity) => ProductModel(name: entity.name, id: const Uuid().v4());


}