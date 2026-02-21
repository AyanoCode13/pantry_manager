import 'package:meal_planner/config/providers/product.providers.dart';
import 'package:provider/single_child_widget.dart';

Future<List<SingleChildWidget>> get appProviders async {
  final productProvidersList = await productProviders;
  return [...productProvidersList];
}