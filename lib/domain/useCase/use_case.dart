import 'package:meal_planner/utils/result.dart';

abstract class UseCase<I, O> {
  Future<Result<O>> call(I input);
}