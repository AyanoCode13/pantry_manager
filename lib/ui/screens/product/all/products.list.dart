import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/config/routing/routes/product.routes.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';



final class ProductsList extends StatelessWidget {
  const ProductsList({super.key});

  @override
  Widget build(BuildContext context) {
    final products = context.watch<ProductViewModel>().products;
    return SliverList.builder(itemCount: products.length, itemBuilder: (context, index) {
      final product = products[index];
      return _ProductListItem(product: product);
    });
  }
}

final class _ProductListItem extends StatelessWidget {
  final ProductEntity product;
  const _ProductListItem({required this.product});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(product.name),
      trailing: IconButton(onPressed: (){context.read<ProductViewModel>().delete.execute(arg: product);}, icon: Icon(Icons.delete)), 
      onTap: () {
        context.read<ProductViewModel>().selectProduct(product);
        context.push(ProductRoutes.view(product.name));
      }
    );
  }
}