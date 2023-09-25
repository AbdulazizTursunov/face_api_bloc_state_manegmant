import 'package:flutter/material.dart';

class Meal {
  Meal({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.image,
  });

  factory Meal.fromJson(Map<String, dynamic> json) => Meal(
        id: json['id'] as String? ?? '',
        title: json['title'] as String? ?? '',
        difficulty: json['difficulty'] as String? ?? '',
        image: json['image'] as String? ?? '',
      );

  Map<String,dynamic> toJson() => {
    'id':id,
    'title':title,
    'difficulty':difficulty,
    'image':image,
  };



  final String id;
  final String title;
  final String difficulty;
  final String image;

  Meal copyWith({
    String? id,
    String? title,
    String? difficulty,
    String? image,
  }) =>
      Meal(
        id: id ?? this.id,
        title: title ?? this.title,
        difficulty: difficulty ?? this.difficulty,
        image: image ?? this.image,
      );
}
