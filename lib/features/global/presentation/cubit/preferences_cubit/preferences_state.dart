part of 'preferences_cubit.dart';

class PreferencesState extends Equatable {
  const PreferencesState({
    required this.isDarkMode,
    required this.languageCode,
    required this.hasPassedInitialProfileSubmitScreen,
  });

  final bool isDarkMode;
  final String languageCode;
  final bool hasPassedInitialProfileSubmitScreen;

  PreferencesState copyWith({
    bool? isDarkMode,
    String? languageCode,
    bool? hasPassedInitialProfileSubmitScreen,
  }) {
    return PreferencesState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      languageCode: languageCode ?? this.languageCode,
      hasPassedInitialProfileSubmitScreen:
          hasPassedInitialProfileSubmitScreen ??
              this.hasPassedInitialProfileSubmitScreen,
    );
  }

  @override
  List<Object> get props =>
      [isDarkMode, languageCode, hasPassedInitialProfileSubmitScreen];
}
