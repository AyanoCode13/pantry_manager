import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/dto/product/create.product.dto.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/abstract/use_case.dart';
import 'package:meal_planner/utils/result.dart';
import 'package:path_provider/path_provider.dart';

final class AddProductUseCase
    implements UseCase<CreateProductDTO, ProductEntity> {
  final Repository<ProductEntity> _repository;

  AddProductUseCase({required Repository<ProductEntity> repository})
    : _repository = repository;
  @override
  Future<Result<ProductEntity>> call({required CreateProductDTO input}) async {
    final product = ProductEntity.create(dto: input);

    final res = await _repository.add(product);

    switch (res) {
      case Ok<void>():
        break;
      case Error<void>():
        return Result.error(res.error);
    }
    return Result.ok(product);
  }
}
