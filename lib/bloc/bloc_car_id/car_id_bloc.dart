import 'package:equatable/equatable.dart';
import 'package:face_api_for_practics/data/api_service/api_service/api_service.dart';
import 'package:face_api_for_practics/data/model/model_car/model_car_by_id.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../repository/reposiyory.dart';

part 'car_id_event.dart';

part 'car_id_state.dart';

class CarIdBloc extends Bloc<CarModelByIdEvent, CarModelByIdState> {
  CarIdBloc({required ApiRepository apiRepository})
      : _apiRepository = apiRepository,
        super(const CarModelByIdState()) {
    on<GetInfoCarByIdEvent>(_getInfoCarByIdEvent);
  }

  Future<void> _getInfoCarByIdEvent(
      GetInfoCarByIdEvent event, Emitter<CarModelByIdState> emit) async {
    emit(state.copyWith(status: IdStatus.loading));
    try{
      final car = await _apiRepository.getCarInfoById(event.id);
      emit(state.copyWith(carModelById: car,status:  IdStatus.success));
    } on UnknownException {
      emit(state.copyWith(status: IdStatus.failure,errorText: 'other error'));
    }on  DioFailure catch (e){
      emit(state.copyWith(status: IdStatus.failure, errorText: '${e.statusCode}\n${e.massage}'));
    }
  }

  final ApiRepository _apiRepository;
}
