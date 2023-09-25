import 'helper_step_model.dart';

class MealById {
  MealById({
    required this.id,
    required this.title,
    required this.difficulty,
    required this.portion,
    required this.time,
    required this.description,
    required this.ingredients,
    required this.method,
    required this.image,
  });

  factory MealById.fromJson(Map<String, dynamic> json) => MealById(
      id: json['id'] as String? ?? '',
      title:json['title'] as String? ?? '',
      difficulty: json['difficulty'] as String? ?? '',
      portion:json['portion'] as String? ?? '',
      time: json['time'] as String? ?? '',
      description: json['description'] as String? ?? '',
      ingredients: json['ingredients'] as List<String>? ?? [],
      method: json['method'],
      image:json['image'] as String? ?? '');

  Map<String, dynamic> toJson() =>{
    'id':id,
    'title':title,
    'difficulty':difficulty,
    'portion':portion,
    'time':time,
    'description':description,
    'ingredients':ingredients,
    'method':method,
    'image':image,

  };

  final String id;
  final String title;
  final String difficulty;
  final String portion;
  final String time;
  final String description;
  final List<String> ingredients;
  final List<Method> method;
  final String image;

  MealById copyWith({
    String? id,
    String? title,
    String? difficulty,
    String? portion,
    String? time,
    String? description,
    List<String>? ingredients,
    List<Method>? method,
    String? image,
  }) =>
      MealById(
        id: id ?? this.id,
        title: title ?? this.title,
        difficulty: difficulty ?? this.difficulty,
        portion: portion ?? this.portion,
        time: time ?? this.time,
        description: description ?? this.description,
        ingredients: ingredients ?? this.ingredients,
        method: method ?? this.method,
        image: image ?? this.image,
      );
}
