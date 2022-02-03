part of 'label_bloc.dart';

class LabelState extends Equatable {
  final String labelValue;
  const LabelState({required this.labelValue});

  @override
  List<Object> get props => [labelValue];
}

class LabelChanged extends LabelState {
  const LabelChanged({required this.labelChangedValue}) : super(labelValue: labelChangedValue);
  final String labelChangedValue;
}
