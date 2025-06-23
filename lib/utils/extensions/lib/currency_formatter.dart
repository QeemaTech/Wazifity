import 'package:intl/intl.dart';
import 'package:wazifati/utils/constant.dart';

extension CurrencyFormatter on Object? {
  String get currencyFormat {
    double? value;

    if (this == null) {
      return '';
    } else if (this is num) {
      value = (this as num).toDouble();
    } else if (this is String) {
      value = double.tryParse(this as String);
    }

    if (value == null) return this.toString();

    final numberFormat = NumberFormat.decimalPattern(Constant.currentLocale);
    final formatted = numberFormat.format(value);

    return Constant.currencyPositionIsLeft
        ? '${Constant.currencySymbol} $formatted'
        : '$formatted ${Constant.currencySymbol}';
  }
}
