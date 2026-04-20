import 'category_entity.dart';

class BudgetEntity {
  final int totalEstimated;
  final int totalSpent;
  final String currency;
  final CategoryEntity? byCategory;

  const BudgetEntity({
    required this.totalEstimated,
    required this.totalSpent,
    required this.currency,
    this.byCategory,
  });
}
