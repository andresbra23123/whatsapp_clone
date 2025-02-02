import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'preferences_state.dart';

class PreferencesCubit extends Cubit<PreferencesState> {
  PreferencesCubit({required this.sharedPreferences})
      : super(
          const PreferencesState(
            isDarkMode: true,
            languageCode: 'en',
            hasPassedInitialProfileSubmitScreen: false,
          ),
        ) {
    _loadPreferences();
  }

  final SharedPreferences sharedPreferences;

  Future<void> _loadPreferences() async {
    final isDarkMode = sharedPreferences.getBool('isDarkMode');
    final languageCode = sharedPreferences.getString('languageCode');
    final hasPassedInitialProfileSubmitScreen =
        sharedPreferences.getBool('hasPassedInitialProfileSubmitScreen');

    emit(
      state.copyWith(
        isDarkMode: isDarkMode,
        languageCode: languageCode,
        hasPassedInitialProfileSubmitScreen:
            hasPassedInitialProfileSubmitScreen,
      ),
    );
  }

  Future<void> onToggleDarkMode() async {
    final newMode = !state.isDarkMode;

    await sharedPreferences.setBool('isDarkMode', newMode);
    emit(state.copyWith(isDarkMode: newMode));
  }

  Future<void> onTogglePassedInitialProfileSubmitScreen() async {
    final hasPassed = !state.hasPassedInitialProfileSubmitScreen;

    await sharedPreferences.setBool(
      'hasPassedInitialProfileSubmitScreen',
      hasPassed,
    );
    emit(state.copyWith(hasPassedInitialProfileSubmitScreen: hasPassed));
  }

  Future<void> onChangeLanguage(String languageCode) async {
    await sharedPreferences.setString('languageCode', languageCode);
    emit(state.copyWith(languageCode: languageCode));
  }
}
