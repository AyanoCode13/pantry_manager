import 'package:go_router/go_router.dart';
import 'package:meal_planner/config/routing/routes.dart';
import 'package:meal_planner/ui/screens/product/add/screen.dart';
import 'package:meal_planner/ui/screens/product/screen.dart';

final List<GoRoute> _routes = [
  GoRoute(
    path: Routes.products,
    builder: (context, state) => const ProductsScreen(),
  ),

  GoRoute(
    path: Routes.addProduct,
    builder: (context, state) => const AddProductScreen(),
  )
];

class HomeScreen {
  const HomeScreen();
}

GoRouter router() => GoRouter(
  initialLocation: Routes.products,
  routes: _routes,
);