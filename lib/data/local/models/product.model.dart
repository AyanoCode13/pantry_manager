import 'dart:io';
import 'dart:math';

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

  final String id;
  final String name;
  final double price;
  final int quantity;
  final String? image;

  ProductModel({required this.id, required this.name, required this.price, required this.quantity, this.image});


  factory ProductModel.fromEntity(ProductEntity entity) {
    return ProductModel(id: entity.id, name: entity.name, price: entity.price, quantity: entity.quantity, image: entity.image?.path);
  }

  ProductEntity toEntity() {
    return ProductEntity(id: id, name: name, price: price, quantity: quantity, image: image != null ? File(image!) : null);
  }
}
