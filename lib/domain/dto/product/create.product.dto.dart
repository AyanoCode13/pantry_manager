import 'package:image_picker/image_picker.dart';

final class CreateProductDTO {
  final String _name;
  final double _price;
  final int _quantity;
  final XFile? _image;

  CreateProductDTO({
    required String name,
    required String price,
    required String quantity,
    XFile? image,
  }) : _name = name,
       _price = double.tryParse(price) ?? 0.0,
       _quantity = int.tryParse(quantity) ?? 1,
       _image = image;

  String get name => _name;
  double get price => _price;
  int get quantity => _quantity;
  XFile? get image => _image;
}
