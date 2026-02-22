import 'package:go_router/go_router.dart';
import 'package:meal_planner/config/routing/routes/product.routes.dart';
import 'package:meal_planner/ui/screens/product/add/screen.dart';
import 'package:meal_planner/ui/screens/product/screen.dart';

final List<GoRoute> _productRoutes = [
  GoRoute(
    path: ProductRoutes.viewAll,
    builder: (context, state) => const ProductsScreen(),
  ),

  GoRoute(
    path: ProductRoutes.add,
    builder: (context, state) => const AddProductScreen(),
  )
];


GoRouter router() => GoRouter(
  initialLocation: ProductRoutes.viewAll,
  routes: [
    ..._productRoutes,
  ]
);