import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:macros_amounts/models/macros_model.dart';
import 'package:macros_amounts/service/calculator_service.dart';

part 'calculator_event.dart';
part 'calculator_state.dart';

class CalculatorBloc extends Bloc<CalculatorEvent, CalculatorState> {
  CalculatorBloc() : super(CalculatorInitial()) {
    on<GetMacrosEvent>(_onGetMacrosEvent);
  }

  void _onGetMacrosEvent(
    GetMacrosEvent event,
    Emitter emit,
  ) async {
    try {
      emit(CalculatorLoading());

      final response = await getMacros(
        gender: event.gender,
        age: event.age,
        height: event.height,
        weight: event.weight,
        activityLevel: event.activityLevel,
        goal: event.goal,
      );

      emit(CalculatorSuccess(data: response));
    } catch (error) {
      emit(CalculatorError(error: error.toString()));
    }
  }
}
