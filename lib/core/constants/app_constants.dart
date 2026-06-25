class AppConstants {
  AppConstants._();

  static const appName = 'GATO';
  static const tagline = 'Small Can Grow';
  static const taglineKirundi = 'Gito Can Cane';
  static const defaultCurrency = 'BIF';

  static const supportedCurrencies = ['BIF', 'USD', 'EUR', 'RWF', 'KES', 'TZS', 'UGX', 'XOF', 'ZMW'];
  static const supportedLanguages = ['en', 'fr', 'rn', 'sw', 'rw'];
  static const supportedLanguageNames = {
    'en': 'English',
    'fr': 'Français',
    'rn': 'Kirundi',
    'sw': 'Kiswahili',
    'rw': 'Kinyarwanda',
  };
  static const defaultLanguage = 'rn';

  static const dataSyncMaxRetries = 3;
  static const dataSyncBatchSize = 50;

  static const offlineModeEnabled = true;
  static const smsEnabled = true;
  static const ussdEnabled = true;
  static const whatsappEnabled = true;
  static const voiceEnabled = true;

  static const trustScoreBaseMax = 100;
  static const trustScoreEmergencyMin = 41;
  static const trustScoreWorkingCapitalMin = 61;
  static const trustScoreInventoryMin = 76;

  static const smsShortcode = 'GATO';
  static const ussdCode = '*123#';
  static const whatsAppBusinessNumber = '+25700000000';

  static const maxLoanAmountWorkingCapital = 300;
  static const maxLoanAmountInventory = 1000;
  static const maxLoanAmountEmergency = 50;
}

class AppRoutes {
  AppRoutes._();

  static const onboarding = '/onboarding';
  static const dashboard = '/';
  static const sales = '/sales';
  static const expenses = '/expenses';
  static const inventory = '/inventory';
  static const reports = '/reports';
  static const savings = '/savings';
  static const profile = '/profile';
  static const community = '/community';
  static const coach = '/coach';
  static const credit = '/credit';
  static const loans = '/loans';
  static const voice = '/voice';
}
