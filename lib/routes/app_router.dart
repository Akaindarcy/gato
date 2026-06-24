import 'package:go_router/go_router.dart';
import 'package:flutter/material.dart';
import '../features/sales/presentation/pages/sales_page.dart';
import '../features/expenses/presentation/pages/expenses_page.dart';
import '../features/inventory/presentation/pages/inventory_page.dart';
import '../features/reports/presentation/pages/reports_page.dart';
import '../features/savings/presentation/pages/savings_page.dart';
import '../features/profile/presentation/pages/profile_page.dart';
import '../features/onboarding/presentation/pages/onboarding_page.dart';
import '../features/community/presentation/pages/community_page.dart';
import '../features/coach/presentation/pages/coach_page.dart';
import '../features/credit/presentation/pages/credit_page.dart';
import '../features/loans/presentation/pages/loans_page.dart';
import '../features/voice/presentation/pages/voice_page.dart';

class AppRouter {
  static GoRouter get router => _router;

  static final GoRouter _router = GoRouter(
    initialLocation: '/onboarding',
    routes: [
      GoRoute(path: '/onboarding', builder: (c, s) => const OnboardingPage()),
      GoRoute(path: '/', builder: (c, s) => const SalesPage()),
      GoRoute(path: '/sales', builder: (c, s) => const SalesPage()),
      GoRoute(path: '/expenses', builder: (c, s) => const ExpensesPage()),
      GoRoute(path: '/inventory', builder: (c, s) => const InventoryPage()),
      GoRoute(path: '/reports', builder: (c, s) => const ReportsPage()),
      GoRoute(path: '/savings', builder: (c, s) => const SavingsPage()),
      GoRoute(path: '/profile', builder: (c, s) => const ProfilePage()),
      GoRoute(path: '/community', builder: (c, s) => const CommunityPage()),
      GoRoute(path: '/coach', builder: (c, s) => const CoachPage()),
      GoRoute(path: '/credit', builder: (c, s) => const CreditPage()),
      GoRoute(path: '/loans', builder: (c, s) => const LoansPage()),
      GoRoute(path: '/voice', builder: (c, s) => const VoicePage()),
    ],
  );
}
