import 'package:bloc_scale_weight/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'weight_event.dart';
part 'weight_state.dart';

class WeightBloc extends Bloc<WeightEvent, WeightState> {
  WeightBloc() : super(WeightState(weightValue: Constant.myInitialWeight)) {
    on<WeightValueUpdatedEvent>(_onUpdateValue);
  }

  void _onUpdateValue(
      WeightValueUpdatedEvent event, Emitter<WeightState> emit) {
    try {
      emit(WeightChanged(weightChangedValue: event.weightValue));
    } catch (e) {
      emit(const WeightFailure(message: "Error"));
    }
  }
}
