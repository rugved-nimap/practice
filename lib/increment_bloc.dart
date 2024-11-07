import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementBloc extends Cubit<int> {
  IncrementBloc() : super(0);

  void increment() {
    emit(state + 1);
  }

}
