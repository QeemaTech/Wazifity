import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:wazifati/utils/api.dart';
import 'package:wazifati/utils/constant.dart';

abstract class FetchLanguageState {}

class FetchLanguageInitial extends FetchLanguageState {}

class FetchLanguageInProgress extends FetchLanguageState {}

class FetchLanguageSuccess extends FetchLanguageState {
  final String code;
  final String? countryCode;
  final String name;
  final String engName;
  final String image;
  final Map data;
  final bool rtl;

  FetchLanguageSuccess({
    required this.code,
    required this.countryCode,
    required this.name,
    required this.engName,
    required this.data,
    required this.image,
    required this.rtl,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'code': code,
      'country_code': countryCode,
      'name': name,
      'name_in_english': engName,
      'image': image,
      'file_name': data,
      'rtl': rtl,
    };
  }

  factory FetchLanguageSuccess.fromMap(Map<String, dynamic> map) {
    return FetchLanguageSuccess(
      code: map['code'] as String,
      countryCode: map['country_code'] as String?,
      name: map['name'] as String,
      engName: map['name_in_english'] as String,
      image: map['image'] as String,
      data: map['file_name'] as Map,
      rtl: map['rtl'] as bool,
    );
  }
}

class FetchLanguageFailure extends FetchLanguageState {
  final String errorMessage;

  FetchLanguageFailure(this.errorMessage);
}

class FetchLanguageCubit extends Cubit<FetchLanguageState> {
  FetchLanguageCubit() : super(FetchLanguageInitial());

  Future<void> getLanguage(String languageCode) async {
    try {
      emit(FetchLanguageInProgress());
      log('Fetching language: $languageCode', name: 'FetchLanguageCubit');

      final response = await Api.get(
        url: Api.getLanguageApi,
        queryParameters: {Api.languageCode: languageCode},
      );

      log('Language API response: $response', name: 'FetchLanguageCubit');

      final data = response['data'];

      if (data == null || data['file_name'] == null || data['file_name'] is! Map) {
        throw Exception('Invalid language data structure or missing file_name');
      }

      Constant.currentLocale =
          Constant.countryLocaleMap[data['country_code']] ?? 'en_US';

      emit(FetchLanguageSuccess(
        code: data['code'],
        countryCode: data['country_code'],
        rtl: data['rtl'],
        image: data['image'],
        engName: data['name_in_english'],
        data: data['file_name'],
        name: data['name'],
      ));
    } catch (e, stack) {
      log('Language Fetch Error: $e', name: 'FetchLanguageCubit', stackTrace: stack);
      emit(FetchLanguageFailure(e.toString()));
    }
  }
}
