part of 'car_bloc.dart';

enum CarStatus { initial, loading, success, failure }

final class CarState extends Equatable {
  const CarState({
    this.carModel = const [],
    this.status = CarStatus.initial,
    this.errorText = '',
  });


  final CarStatus status;
  final List<CarModel> carModel;
  final String errorText;

  CarState copyWith({
    CarStatus? status,
    List<CarModel> ? carModel,
    String? errorText,
  }) =>
      CarState(
        carModel: carModel ?? this.carModel,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status, carModel, errorText];
}
