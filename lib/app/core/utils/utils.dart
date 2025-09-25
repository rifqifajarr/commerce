import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

export '../../data/preferences.dart';

Size size(BuildContext context) => MediaQuery.of(context).size;

String formatDollar(double amount) {
  final formatCurrency = NumberFormat.currency(
    locale: 'en_US',
    symbol: '\$',
    decimalDigits: 2,
  );
  return formatCurrency.format(amount);
}
