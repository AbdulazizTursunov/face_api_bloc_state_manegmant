import 'package:dio/dio.dart';
import 'package:face_api_for_practics/data/model/universal_data.dart';
import 'package:flutter/material.dart';


UniversalResponse getDioCustomError(DioException exception) {
  debugPrint('DIO ERROR TYPE: ${exception.type}');
  if (exception.response != null) {
    return UniversalResponse(error: exception.response!.data['message']);
  }
  switch (exception.type) {
    case DioExceptionType.sendTimeout:
      {
        return UniversalResponse(error: 'sendTimeout');
      }
    case DioExceptionType.receiveTimeout:
      {
        return UniversalResponse(error: 'receiveTimeout');
      }
    case DioExceptionType.cancel:
      {
        return UniversalResponse(error: 'cancel');
      }
    case DioExceptionType.badCertificate:
      {
        return UniversalResponse(error: 'badCertificate');
      }
    case DioExceptionType.badResponse:
      {
        return UniversalResponse(error: 'badResponse');
      }
    case DioExceptionType.connectionError:
      {
        return UniversalResponse(error: 'connectionError');
      }
    case DioExceptionType.connectionTimeout:
      {
        return UniversalResponse(error: 'connectionTimeout');
      }
    default:
      {
        return UniversalResponse(error: 'unknown');
      }
  }
}