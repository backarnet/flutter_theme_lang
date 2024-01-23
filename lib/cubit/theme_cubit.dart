import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cache_helper.dart';
import '../theme_data.dart';
part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(ThemeState(themes.values.first));

  Future<void> changeThemeIndex(int index) async {
    await CacheHelper().saveThemeIndex(index);
    emit(ThemeState(themes.values.elementAt(index)));
  }

  Future<void> getThemeIndex() async {
    final index = await CacheHelper().getThemeIndex();
    emit(ThemeState(themes.values.elementAt(index)));
  }
}
