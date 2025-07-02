import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:wazifati/utils/hive_utils.dart';

class AppLocalization {
  final Locale locale;

  late Map<String, String> _localizedValues;

  AppLocalization(this.locale);

  static AppLocalization? of(BuildContext context) {
    return Localizations.of<AppLocalization>(context, AppLocalization);
  }

  Future<void> loadJson() async {
    String jsonStringValues;

    try {
      jsonStringValues = await rootBundle
          .loadString('assets/languages/${locale.languageCode}.json');
    } catch (e) {
      jsonStringValues =
          await rootBundle.loadString('assets/languages/en.json');
    }

    Map<String, dynamic> mappedJson = {};

    final localHiveLanguage = HiveUtils.getLanguage();
    if (localHiveLanguage == null || localHiveLanguage['data'] == null) {
      mappedJson = json.decode(jsonStringValues);
    } else {
      mappedJson = Map<String, dynamic>.from(localHiveLanguage['data']);
    }

    _localizedValues =
        mappedJson.map((key, value) => MapEntry(key, value.toString()));
  }

  String? getTranslatedValues(String? key) {
    if (key == null) return null;
    return _localizedValues[key];
  }

  static const LocalizationsDelegate<AppLocalization> delegate =
      _AppLocalizationDelegate();
}

class _AppLocalizationDelegate extends LocalizationsDelegate<AppLocalization> {
  const _AppLocalizationDelegate();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'ar'].contains(locale.languageCode);
  }

  @override
  Future<AppLocalization> load(Locale locale) async {
    AppLocalization localization = AppLocalization(locale);
    await localization.loadJson();
    return localization;
  }

  @override
  bool shouldReload(covariant LocalizationsDelegate<AppLocalization> old) =>
      false;
}
