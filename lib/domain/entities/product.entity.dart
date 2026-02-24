import 'package:meal_planner/domain/abstract/model.dart';
import 'package:uuid/uuid.dart';

class ProductEntity extends Model {
  final String name;

  const ProductEntity({
    required super.id,
    required this.name,
  });

   factory ProductEntity.create({
    required String name,
  }) {
    return ProductEntity(
      id: const Uuid().v4(),
      name: name,
    );
  }

  @override
  List<Object?> get props => [id, name];
}