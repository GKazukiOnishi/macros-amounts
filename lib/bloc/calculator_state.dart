part of 'calculator_bloc.dart';

sealed class CalculatorState extends Equatable {
  const CalculatorState();

  @override
  List<Object> get props => [];
}

final class CalculatorInitial extends CalculatorState {}

final class CalculatorSuccess extends CalculatorState {
  final MacrosModel? data;

  const CalculatorSuccess({required this.data});
}

final class CalculatorLoading extends CalculatorState {}

final class CalculatorError extends CalculatorState {
  final String? error;

  const CalculatorError({required this.error});
}
