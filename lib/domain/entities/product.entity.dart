import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:meal_planner/domain/dto/product/create.product.dto.dart';
import 'package:meal_planner/domain/abstract/model.dart';
import 'package:uuid/uuid.dart';

class ProductEntity extends Model {
  final String name;
  final double price;
  final int quantity;
  final File? image;

  const ProductEntity({
    required super.id,
    required this.name, 
    required this.price, 
    required this.quantity,
    this.image
  });

   factory ProductEntity.create({
    required CreateProductDTO dto,
  }) {
    return ProductEntity(
      id: const Uuid().v4(),
      name: dto.name, 
      price: dto.price, 
      quantity: dto.quantity,
      image: dto.image != null ? File(dto.image!.path) : null,
    );
  }

  @override
  List<Object?> get props => [id, name];
}