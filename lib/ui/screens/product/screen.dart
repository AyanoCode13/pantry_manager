import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/config/routing/routes/product.routes.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/ui/screens/product/products.list.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';

final class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: ListenableBuilder(
        listenable: context.watch<ProductViewModel>().load,
        builder: (context, child) {
          if (context.watch<ProductViewModel>().load.running) {
            return const Center(child: CircularProgressIndicator());
          }
          if (context.watch<ProductViewModel>().load.failed) {
            return const Center(child: Text('Error loading products'));
          }
          return child!;
        },
        child: ListenableBuilder(listenable: context.watch<ProductViewModel>(), builder: (context, _) {
          return CustomScrollView(slivers: [
            SliverAppBar(title: Text('Products'), actions: [
              IconButton.filled(onPressed: (){
                context.push(ProductRoutes.add);
              }, icon: Icon(Icons.add))
            ],),
            ProductsList()
          ]);
        })
      )
    );
  }
}