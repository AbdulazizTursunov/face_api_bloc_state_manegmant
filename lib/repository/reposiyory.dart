

import 'package:face_api_for_practics/data/api_service/api_service/api_service.dart';
import 'package:face_api_for_practics/data/model/model_car/model_car.dart';
import 'package:face_api_for_practics/data/model/model_car/model_car_by_id.dart';


class ApiRepository{
  ApiRepository({required this.apiService});
  final ApiService apiService;

  Future<List<CarModel>> getAllCar()=> apiService.getSimpleAllCars();

  Future<CarModelById> getCarInfoById(int id)=>apiService.getCarById(id);

}