import 'dart:io';

import 'package:image_picker/image_picker.dart';

final class CreateProductDTO {
  final String _name;
  final double _price;
  final int _quantity;
  final String description;
  final XFile? _image;

  CreateProductDTO({
    required String name,
    required String price,
    required String quantity,
    required this.description,
    XFile? image,
  }) : _name = name, _price = double.tryParse(price) ?? 0.0, _quantity = int.tryParse(quantity) ?? 0, _image = image;

  String get name => _name;
  double get price => _price;
  int get quantity => _quantity;
  File? get image => _image != null ? File(_image.path) : null;
}
