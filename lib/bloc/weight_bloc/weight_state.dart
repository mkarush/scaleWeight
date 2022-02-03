part of 'weight_bloc.dart';

class WeightState extends Equatable {
  final String weightValue;
  const WeightState({required this.weightValue});

  @override
  List<Object> get props => [weightValue];
}

class WeightChanged extends WeightState {
  const WeightChanged({required this.weightChangedValue})
      :super(weightValue: weightChangedValue);

  final String weightChangedValue;
}

class WeightFailure extends WeightState {
  final String message;

  const WeightFailure({required this.message}) : super(weightValue: message);

  @override
  List<Object> get props => [message];
}

