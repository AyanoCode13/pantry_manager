import 'package:flutter/material.dart';

final class AddProductScreen extends StatelessWidget {
  const AddProductScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Product')),
      body: const Center(child: Text('Add Product Screen')),
    );
  }
}