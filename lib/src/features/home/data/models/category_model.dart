import 'package:wonder_souls/src/features/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  CategoryModel({
    required super.transportation,
    required super.accommodation,
    required super.food,
    required super.activities,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      transportation: json['transportation'],
      accommodation: json['accommodation'],
      food: json['food'],
      activities: json['activities'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transportation': transportation,
      'accommodation': accommodation,
      'food': food,
      'activities': activities,
    };
  }
}
