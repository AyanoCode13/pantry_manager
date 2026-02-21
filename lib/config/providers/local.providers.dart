import 'package:meal_planner/data/local/db/local.db.dart';
import 'package:meal_planner/data/local/repository/local.product.repository.dart';
import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';
import 'package:meal_planner/domain/useCase/product/delele.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getAll.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getById.useCase.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> get _productProviders async {
  final LocalProductRepository localProductRepository = LocalProductRepository(productDAO: LocalDatabase.instance.productDAO);
  final AddProductUseCase addProductUseCase = AddProductUseCase(productRepository: localProductRepository as ProductRepository);
  final GetAllProductsUseCase getAllProductsUseCase = GetAllProductsUseCase(productRepository: localProductRepository as ProductRepository);
  final DeleteProductUseCase deleteProductUseCase = DeleteProductUseCase(productRepository: localProductRepository as ProductRepository);
  final GetByIdUseCase getByIdUseCase = GetByIdUseCase(productRepository: localProductRepository as ProductRepository);


  return [
    ChangeNotifierProvider(create:  (context) {
      return ProductViewModel(
        addProductUseCase: addProductUseCase, 
        getAllProductsUseCase: getAllProductsUseCase,
        deleteProductUseCase: deleteProductUseCase,
        getByIdUseCase: getByIdUseCase
      );
    })
  ];
} 

Future<List<SingleChildWidget>> get localProviders  async {
  await LocalDatabase.initialize();
  return [
    ...await _productProviders
  ];
}
