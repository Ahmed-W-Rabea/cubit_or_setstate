part of 'changing_cubit.dart';

@immutable
sealed class ChangingState {}

final class ChangingInitial extends ChangingState {}

final class Fly extends ChangingState {}

final class Me extends ChangingState {}

final class To extends ChangingState {}

final class The extends ChangingState {}

final class Moon extends ChangingState {}

final class Reset extends ChangingState {}

final class ChangeValue extends ChangingState {
  String? gender;
  String? val;
  ChangeValue() {
    gender = val;
  }
}
