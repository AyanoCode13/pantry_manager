import 'package:meal_planner/data/local/db/local.db.dart';
import 'package:meal_planner/data/local/repository/local.product.repository.dart';
import 'package:meal_planner/domain/abstract/product.repository.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> get _localProductProviders  async {
  final db = await $FloorLocalDatabase.databaseBuilder('local.db').build();
  final LocalProductRepository repository = LocalProductRepository(productDAO: db.productDAO);
  final AddProductUseCase addProductUseCase = AddProductUseCase(repository: repository as ProductRepository);
  return [
    ChangeNotifierProvider(create: (context) {
      return ProductViewModel(addProductUseCase: addProductUseCase);
    })
  ];
}

Future<List<SingleChildWidget>> get productProviders async {
  final localProductProviders = await _localProductProviders;
  return [...localProductProviders];
}