import 'package:floor/floor.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';

@Entity(
  tableName: 'products',
  primaryKeys: ['id'],
  indices: [
    Index(value: ['id'], unique: true),
    Index(value: ['name'], unique: true),
  ],
)
class ProductModel {
  @primaryKey
  final String id;

  final String name;

  ProductModel({
    required this.id,
    required this.name,
  });

  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(
      id: entity.id,
      name: entity.name,
    );
  }

  ProductEntity toEntity() {
    return ProductEntity(
      id: id,
      name: name,
    );
  }
}