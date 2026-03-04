import 'package:floor/floor.dart';
import 'package:meal_planner/domain/abstract/model.dart';
import 'package:meal_planner/domain/entities/product/product.entity.dart';


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
  final String description;
  final double price;
  final int quantity;
  final String image;

  const ProductModel({required this.id, required this.name, required this.description, required this.price, required this.quantity, required this.image});

  factory ProductModel.fromEntity({required ProductEntity entity}) => ProductModel(
    id: entity.id,
    name: entity.name,
    description: entity.description,
    price: entity.price,
    quantity: entity.quantity,
    image: "",
  );

  
}
