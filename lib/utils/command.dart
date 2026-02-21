import 'package:flutter/foundation.dart';
import 'package:meal_planner/utils/result.dart';

typedef BasicAction<T> = Future<Result<T>> Function();
typedef ComplexAction<T, A> = Future<Result<T>> Function(A);

abstract class Command<T> extends ChangeNotifier {
  Command();

  bool _running = false;
  bool get running => _running;

  Result<T>? _result;
  Result<T>? get result => _result;
  bool get completed => _result is Ok;
  bool get failed => _result is Error;
  

  void reset() {
    _result = null;
    notifyListeners();
  }

  Future<void> _execute({required BasicAction<T> action }) async {
   
    if (_running) return;
    _running = true;
    _result = null;
    notifyListeners();

    try {
      _result = await action();
    } finally {
      _running = false;
      notifyListeners();
    }
  }
}

class BasicCommand<T> extends Command<T> {
  
  BasicCommand(this._action);

  final BasicAction<T> _action;

  Future<void> execute() async {
    await _execute(action: () => _action());
  }
}

class ComplexCommand<T, A> extends Command<T> {
  
  ComplexCommand(this._action);

  final ComplexAction<T, A> _action;

  Future<void> execute({required A arg }) async {
    
    await _execute(action: () => _action(arg));
  }
}