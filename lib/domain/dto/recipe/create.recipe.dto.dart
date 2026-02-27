import 'package:meal_planner/domain/entities/product.entity.dart';

final class CreateRecipeDTO {
  final String _name;
  final String? _image;
  final String? _description;
  final List<ProductEntity> _ingredients;

  CreateRecipeDTO({
    required String name,
    String? image,
    String? description,
    required List<ProductEntity> ingredients,
  }) : _name = name,
       _image = image,
       _description = description,
       _ingredients = ingredients;

  String get name => _name;
  double get price =>
      _ingredients.fold(0.0, (sum, ingredient) => sum + ingredient.price);
  String get image => _image ?? "";
  String get description => _description ?? "";
  String get ingredients => _ingredients.fold("", (sum, ingredient) => "${ingredient.quantity}x ${ingredient.name}/n");
}
