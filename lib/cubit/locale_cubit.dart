import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_lang/cache_helper.dart';

part 'locale_state.dart';

class LocaleCubit extends Cubit<LocaleState> {
  LocaleCubit() : super(LocaleState(const Locale('en')));

  Future<void> changeLocalCode(String code) async {
    await CacheHelper().saveLocalCode(code);
    emit(LocaleState(Locale(code)));
  }

  Future<String> getLocaleCode() async {
    final code = await CacheHelper().getLocalCode();
    emit(LocaleState(Locale(code)));
    return code;
  }
}
