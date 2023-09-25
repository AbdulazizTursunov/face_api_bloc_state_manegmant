import 'package:equatable/equatable.dart';
import 'package:face_api_for_practics/data/api_service/api_service/api_service.dart';
import 'package:face_api_for_practics/data/model/model_car/model_car.dart';
import 'package:face_api_for_practics/repository/reposiyory.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'car_event.dart';

part 'car_state.dart';

class CarBloc extends Bloc<CarEvent, CarState> {
  CarBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const CarState()) {
    on<GetAllCarEvent>(_getAllCarEvent);
  }

  final ApiRepository _apiRepository;

  Future<void> _getAllCarEvent(
    GetAllCarEvent event,
    Emitter<CarState> emit,
  ) async {
    emit(state.copyWith(status: CarStatus.loading));
    try {
      final data = await _apiRepository.getAllCar();
      emit(state.copyWith(carModel: data, status: CarStatus.success));
    } on UnknownException {
      emit(state.copyWith(status: CarStatus.failure, errorText: 'nomalum hato'));
    } on DioFailure catch(e){
      emit(state.copyWith(status: CarStatus.failure, errorText: '${e.statusCode}\n${e.massage}'));
    }
  }
}
