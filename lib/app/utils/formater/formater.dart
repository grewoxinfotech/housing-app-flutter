import 'package:intl/intl.dart';

class Formatter{
  Formatter._();

  static String formatPriceIndian(double value) {
    final formatter = NumberFormat.currency(
      locale: 'en_IN',   // Indian locale
      symbol: '₹',       // Rupee symbol
      decimalDigits: 0,  // No decimal for round prices
    );
    return formatter.format(value);
  }

  static String formatPriceCompact(double value) {
    if (value >= 10000000) {
      return '₹${(value / 10000000).toStringAsFixed(0)} Cr';
    } else if (value >= 100000) {
      return '₹${(value / 100000).toStringAsFixed(0)} L';
    } else if (value >= 1000) {
      return '₹${(value / 1000).toStringAsFixed(0)} K';
    }
    return '₹$value';
  }

  static String formatPriceInternational(double value) {
    final formatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '₹',
      decimalDigits: 0,
    );
    return formatter.format(value);
  }
}
