import 'package:gato/lib/core/constants/app_constants.dart';

class AICoachService {
  final String? apiKey;

  AICoachService({this.apiKey});

  String suggestInventoryAlert({
    required int currentStock,
    required double avgDailySales,
    required String productName,
  }) {
    if (avgDailySales <= 0) return '$productName stock is stable.';
    final daysLeft = currentStock / avgDailySales;
    if (daysLeft <= 1) return 'You may run out of $productName in 1 day. Consider restocking.';
    if (daysLeft <= 3) return '$productName may run low in ${daysLeft.round()} days. Plan a restock.';
    return 'Stock level for $productName is healthy.';
  }

  String suggestPricingAdjustment({
    required double currentMargin,
    required double competitorMarginHint,
    required String productName,
  }) {
    if (competitorMarginHint > currentMargin + 0.05) {
      return 'Consider increasing $productName price by ~5% to match market margins.';
    }
    if (competitorMarginHint < currentMargin - 0.05) {
      return 'Consider reducing $productName price slightly or promoting bulk sales to stay competitive.';
    }
    return '$productName pricing looks aligned with market trends.';
  }

  String generateWeeklyInsight({
    required double thisWeekProfit,
    required double lastWeekProfit,
    required List<String> topCategories,
  }) {
    final delta = thisWeekProfit - lastWeekProfit;
    if (delta > 0) {
      return 'Great job: profit increased by ${delta.toStringAsFixed(2)} this week. ${_bestCategory(topCategories)} is your best category.';
    } else if (delta < 0) {
      return 'Profit decreased by ${delta.abs().toStringAsFixed(2)} this week. Review expenses and consider adjusting stock levels.';
    }
    return 'Profit is stable this week. ${_bestCategory(topCategories)} remains your best category.';
  }

  String loanReadinessHint(int trustScore) {
    if (trustScore >= AppConstants.trustScoreWorkingCapitalMin) {
      return 'You qualify for a working capital loan. Continue consistent records to increase your limit.';
    } else if (trustScore >= AppConstants.trustScoreEmergencyMin) {
      return 'You qualify for a small emergency loan. Build savings history to unlock higher amounts.';
    }
    return 'Keep recording sales daily to unlock loan eligibility.';
  }

  String _bestCategory(List<String> categories) {
    if (categories.isEmpty) return 'No category data';
    final counts = <String, int>{};
    for (final c in categories) counts[c] = (counts[c] ?? 0) + 1;
    final best = counts.entries.reduce((a, b) => a.value >= b.value ? a : b).key;
    return best;
  }
}
