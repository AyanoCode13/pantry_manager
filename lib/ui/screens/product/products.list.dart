import 'package:flutter/material.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';

final class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductViewModel>().products;
    return SliverList.builder(itemCount: products.length, itemBuilder: (context, index) {
      final product = products[index];
      return ListTile(title: Text(product.name));
    });
  }
}