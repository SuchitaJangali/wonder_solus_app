import '../../domain/entities/budget_entity.dart';
import 'category_model.dart';

class BudgetModel extends BudgetEntity {
  BudgetModel({
    required super.totalEstimated,
    required super.totalSpent,
    required super.currency,
    super.byCategory,
  });

  factory BudgetModel.fromJson(Map<String, dynamic> json) {
    return BudgetModel(
      totalEstimated: json['totalEstimated'],
      totalSpent: json['totalSpent'],
      currency: json['currency'],
      byCategory: CategoryModel.fromJson(json['byCategory']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'totalEstimated': totalEstimated,
      'totalSpent': totalSpent,
      'currency': currency,
      'byCategory': byCategory != null
          ? (byCategory as CategoryModel).toJson()
          : null,
    };
  }
}
