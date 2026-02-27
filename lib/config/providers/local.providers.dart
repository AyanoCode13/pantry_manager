import 'package:meal_planner/data/local/db/local.db.dart';
import 'package:meal_planner/data/local/repository/local.product.repository.dart';
import 'package:meal_planner/data/local/repository/local.recipe.repository.dart';
import 'package:meal_planner/domain/abstract/repository.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/domain/entities/recipe.entity.dart';
import 'package:meal_planner/domain/useCase/product/add.useCase.dart';
import 'package:meal_planner/domain/useCase/product/delele.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getAll.useCase.dart';
import 'package:meal_planner/domain/useCase/product/getById.useCase.dart';
import 'package:meal_planner/domain/useCase/recipe/add.useCase.dart';
import 'package:meal_planner/domain/useCase/recipe/getAll.useCase.dart';
import 'package:meal_planner/service/file.storage.service.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:meal_planner/ui/viewModels/recipe.viewModel.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

List<SingleChildWidget> get _productProviders {
  final LocalProductRepository localProductRepository = LocalProductRepository(
    productDAO: LocalDatabase.instance.productDAO,
    fileStorageService: FileStorageService()
  );
  final AddProductUseCase addProductUseCase = AddProductUseCase(repository: localProductRepository as Repository<ProductEntity>);
  final GetAllProductsUseCase getAllProductsUseCase = GetAllProductsUseCase(repository: localProductRepository as Repository<ProductEntity>);
  final DeleteProductUseCase deleteProductUseCase = DeleteProductUseCase(repository: localProductRepository as Repository<ProductEntity>);
  final GetByIdUseCase getByIdUseCase = GetByIdUseCase(repository: localProductRepository as Repository<ProductEntity>);


  return [
    ChangeNotifierProvider(create:  (context) => ProductViewModel(
        addProductUseCase: addProductUseCase, 
        getAllProductsUseCase: getAllProductsUseCase,
        deleteProductUseCase: deleteProductUseCase,
        getByIdUseCase: getByIdUseCase
      )
    )
  ];
} 


List<SingleChildWidget> get _recipeProviders {
  final LocalRecipeRepsitory localRecipeRepsitory = LocalRecipeRepsitory(
    recipeDAO: LocalDatabase.instance.recipeDAO,
    fileStorageService: FileStorageService()
  );
  final AddRecipeUseCase addRecipeUseCase = AddRecipeUseCase(repository: localRecipeRepsitory as Repository<RecipeEntity>);
  final GetAllRecipesUseCase getAllRecipesUseCase = GetAllRecipesUseCase(repository: localRecipeRepsitory as Repository<RecipeEntity>);
  return [
    ChangeNotifierProvider(create: (context) => RecipeViewModel(
      addRecipeUseCase: addRecipeUseCase,
      getAllRecipesUseCase: getAllRecipesUseCase
    ))
  ];
}

Future<List<SingleChildWidget>> get localProviders  async {
  await LocalDatabase.initialize();
  return [
    ..._productProviders,
    ..._recipeProviders
  ];
}
