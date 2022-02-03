part of 'weight_bloc.dart';

@immutable
abstract class WeightEvent extends Equatable {
  const WeightEvent();
  @override
  List<Object> get props => [];
}

class WeightValueUpdatedEvent extends WeightEvent {
  const WeightValueUpdatedEvent({required this.weightValue});

  final String weightValue;

  @override
  List<Object> get props => [weightValue];
}