import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/useCase/use_case.dart';
import 'package:meal_planner/utils/result.dart';

class DeleteProductUseCase implements UseCase<String, void> {
  final ProductRepository _productRepository;

  DeleteProductUseCase({required ProductRepository productRepository}) : _productRepository = productRepository;

  @override
  Future<Result<void>> call(String input) {
    // TODO: implement call
    return _productRepository.delete(input);
  }
  
}