part of 'calculator_bloc.dart';

sealed class CalculatorEvent extends Equatable {
  const CalculatorEvent();

  @override
  List<Object> get props => [];
}

class GetMacrosEvent extends CalculatorEvent {
  final String? gender;
  final int? age;
  final int? height;
  final int? weight;
  final String? activityLevel;
  final String? goal;

  const GetMacrosEvent({
    this.age,
    this.height,
    this.weight,
    this.activityLevel,
    this.goal,
    this.gender,
  });
}
