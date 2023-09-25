import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:face_api_for_practics/utils/constnt/constants.dart';
import 'package:flutter/foundation.dart';
import '../../model/model_car/model_car.dart';
import '../../model/model_car/model_car_by_id.dart';

class ApiService {
  ApiService() {
    _init();
  }

  Dio dio = Dio(
      BaseOptions(
        baseUrl: baseUrl,
    connectTimeout: Duration(seconds: TimeOutConstants.connectTimeout),
    receiveTimeout: Duration(seconds: TimeOutConstants.receiveTimeout),
    sendTimeout: Duration(seconds: TimeOutConstants.sendTimeout),
  ));


  void _init() =>
      dio.interceptors.addAll([
        LogInterceptor(
            responseBody: kDebugMode,
            requestBody: kDebugMode,
            logPrint: (object) =>
            kDebugMode ? log('Dio Log: ${object.toString()}') : null)
      ]);

  Future<List<CarModel>> getSimpleAllCars()async{
    try {
      final Response response = await dio.get('/companies');
      if (kDebugMode) {
        print(response.data['data']);
      }
      if ((response.statusCode! >= 200) && (response.statusCode! < 300)) {
        return [
          for(final e in response.data['data'] as List)
            CarModel.fromJson(e)
        ];
      }
      throw UnknownException();
    } on DioException catch(e){
      throw DioFailure(massage: e.message, statusCode: e.response?.statusCode ?? 0);
    }
  }

  Future<CarModelById> getCarById(int id) async{
    try{
      final Response response = await dio.get('/companies/$id');
      if(kDebugMode){
        print(response.data);
      }
      if((response.statusCode! >= 200) && (response.statusCode! < 300)){
        return CarModelById.fromJson(response.data);
      }
      throw UnknownException();
    }on DioException catch(e){
      throw DioFailure(massage:e.message,statusCode: e.response?.statusCode ?? 0);
    }
  }

}

class UnknownException implements Exception {}


class DioFailure implements Exception {
  DioFailure({ this.statusCode, this.massage});
  final int? statusCode;
  final String? massage;
}

