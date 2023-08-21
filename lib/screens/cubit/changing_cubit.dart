import 'package:meta/meta.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc/bloc.dart';

part 'changing_state.dart';

class ChangingCubit extends Cubit<ChangingState> {
  ChangingCubit() : super(ChangingInitial());

  void fly() {
    emit(Fly());
  }

  me() {
    emit(Me());
  }

  to() {
    emit(To());
  }

  the() {
    emit(The());
  }

  moon() {
    emit(Moon());
  }

  reset() {
    emit(Reset());
  }

  changeValue() {
    emit(ChangeValue());
  }
}
