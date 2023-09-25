part of 'car_id_bloc.dart';

abstract class CarModelByIdEvent extends Equatable {
  const CarModelByIdEvent();
  @override
  List<Object> get props => [];
}
class GetInfoCarByIdEvent extends CarModelByIdEvent{
  const GetInfoCarByIdEvent({required this.id});
  final int id;
  @override
  List<Object> get props => [];
}
