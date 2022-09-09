part of 'weighting_cubit.dart';

abstract class WeightingState extends Equatable {
  final FitWeighting weightData;
  const WeightingState(this.weightData);

  @override
  List<Object> get props => [weightData];
}

class WeightingInitial extends WeightingState {
  const WeightingInitial(super.weightData);
}

class WeightingModified extends WeightingState {
  const WeightingModified(super.weightData);
}

class WeightingSaving extends WeightingState {
  const WeightingSaving(super.weightData);
}
