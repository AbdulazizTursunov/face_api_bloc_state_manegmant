
import 'package:equatable/equatable.dart';

class CarModel extends Equatable{
  const CarModel({
    required this.id,
    required this.logo,
    required this.averagePrice,
    required this.carModel,
    required this.establishedYear,
  });



  factory CarModel.fromJson(Map<String, dynamic> json) => CarModel(
        id: json['id'] as int? ?? 0,
        logo: json['logo'] as String? ?? '',
        averagePrice: json['average_price'] as int? ?? 0,
        carModel: json['car_model'] as String? ?? '',
        establishedYear: json['established_year'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'logo': logo,
        'price': averagePrice,
        'car_model': carModel,
        'establishedYEar': establishedYear,
      };

  CarModel copyWith({
    int? id,
    String? logo,
    int? averagePrice,
    String? carModel,
    int? establishedModel,
  }) =>
      CarModel(
        id: id ?? this.id,
        logo: logo ?? this.logo,
        averagePrice: averagePrice ?? this.averagePrice,
        carModel: carModel ?? this.carModel,
        establishedYear: establishedYear,
      );

  final int id;
  final String carModel;
  final int averagePrice;
  final String logo;
  final int establishedYear;

  @override
  List<Object?> get props => [
    id,
    logo,
    averagePrice,
    carModel,
    establishedYear,
  ];
}
