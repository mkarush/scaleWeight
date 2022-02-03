import 'package:bloc_scale_weight/theme/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';

part 'label_event.dart';
part 'label_state.dart';

class LabelBloc extends Bloc<LabelEvent, LabelState> {
  LabelBloc() : super(LabelState(labelValue: Constant.myInitialLabel)) {
    on<LabelValueChangedEvent>(_onUpdateValue);
  }

  void _onUpdateValue( LabelValueChangedEvent event, Emitter<LabelState> emit) {
    emit(
        LabelChanged(
            labelChangedValue: event.labelValue
        )
    );
  }
}
