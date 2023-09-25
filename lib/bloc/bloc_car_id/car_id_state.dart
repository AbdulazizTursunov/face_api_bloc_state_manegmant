part of 'car_id_bloc.dart';

final class CarModelByIdState extends Equatable {
  const CarModelByIdState({
    this.status = IdStatus.initial,
    this.carModelById = const CarModelById.initial(),
    this.errorText = '',
  });

  final IdStatus status;
  final CarModelById carModelById;
  final String errorText;



  CarModelByIdState copyWith({
    IdStatus? status,
    CarModelById ? carModelById,
    String? errorText,
  }) =>
      CarModelByIdState(
        carModelById: carModelById ?? this.carModelById,
        errorText: errorText ?? this.errorText,
        status: status ?? this.status,
      );

  @override
  List<Object?> get props => [status, carModelById, errorText];
}

enum IdStatus { initial, loading, success, failure }
