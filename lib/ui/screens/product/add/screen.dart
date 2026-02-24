import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:meal_planner/domain/entities/product.entity.dart';
import 'package:meal_planner/ui/viewModels/product.viewModel.dart';
import 'package:provider/provider.dart';

final class AddProductScreen extends StatelessWidget {
  AddProductScreen({super.key}) {
    _nameFormField =  TextFormField(
      decoration: InputDecoration(labelText: "Name"),
      controller: TextEditingController(),
    );
    
  }
  late final TextFormField _nameFormField;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Product'), actions: [
       
      ],),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child:_nameFormField
          ),
          ElevatedButton.icon(onPressed: () {
            context.read<ProductViewModel>().add.execute(arg: ProductEntity.create(name: _nameFormField.controller!.text));
            context.pop();
          }, label: Text("Save"), icon: Icon(Icons.save),)
        ],
      )
    );
  }
}