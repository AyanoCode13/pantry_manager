import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {

  final String name;

  const ProductEntity({

    required this.name,
  });
  
  @override
  // TODO: implement props
  List<Object?> get props => [name];

  

}