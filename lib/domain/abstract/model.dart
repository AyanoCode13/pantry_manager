import 'package:equatable/equatable.dart';

abstract class Model extends Equatable{
  final String id;

  const Model.create({required this.id});

}