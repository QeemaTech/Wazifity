import 'package:wazifati/app/app_localization.dart';
import 'package:flutter/cupertino.dart';

extension TranslateString on String {
  String translate(BuildContext context) {
    final translation = AppLocalization.of(context)?.getTranslatedValues(this);
    return (translation ?? this).trim();
  }
}
