import 'package:equatable/equatable.dart';

class CarModelById extends Equatable {
  const CarModelById({
    required this.establishedYear,
    required this.carModel,
    required this.logo,
    required this.id,
    required this.description,
    required this.carPics,
    required this.averagePrice,
  });

  const CarModelById.initial()
      : this(
          carModel: '',
          establishedYear: 0,
          averagePrice: 0,
          id: 0,
          description: '',
          carPics: const [],
          logo: '',
        );


  factory CarModelById.fromJson(Map<String, dynamic> json) => CarModelById(
        establishedYear: json['established_year'] as int? ?? 0,
        carModel: json['car_model'] as String? ?? '',
        logo: json['logo'] as String? ?? '',
        id: json['id'] as int? ?? 0,
        description: json['description'] as String? ?? '',
        carPics: json['car_pics'] as List<dynamic>? ?? [],
        averagePrice: json['average_price'] as int? ?? 0,
      );

  Map<String, dynamic> toJson() => {
        'establishedYear': establishedYear,
        'carModel': carModel,
        'logo': logo,
        'id': id,
        'description': description,
        'carPics': carPics,
        'averagePrice': averagePrice
      };

  final int id;
  final String carModel;
  final String logo;
  final int establishedYear;
  final List<dynamic> carPics;
  final int averagePrice;
  final String description;

  @override
  List<Object?> get props => [
        id,
        carModel,
        logo,
        establishedYear,
        carPics,
        averagePrice,
        description,
      ];
}
