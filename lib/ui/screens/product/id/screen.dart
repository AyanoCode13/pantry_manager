import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';

final class ViewAndEditProductScreen extends StatelessWidget {
  const ViewAndEditProductScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
   final product = context.watch<ProductViewModel>().selectedProduct;
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(actions: [ IconButton(onPressed: (){
        print(product);
        context.read<ProductViewModel>().delete.execute(arg: product);
        context.pop();
        }, icon: Icon(Icons.delete))],),
      body: Center(child: Text("View and Edit"),),
    );
  }

}   