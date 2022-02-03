part of 'label_bloc.dart';

@immutable
abstract class LabelEvent extends Equatable {
  const LabelEvent();

  @override
  List<Object> get props => [];
}

class LabelValueChangedEvent extends LabelEvent {
  const LabelValueChangedEvent({required this.labelValue});

  final String labelValue;

  @override
  List<Object> get props => [labelValue];
}

