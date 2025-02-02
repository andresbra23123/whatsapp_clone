import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

export 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations get l10n => AppLocalizations.of(this);
}

extension AppLocalizationsExtensions on AppLocalizations {
  List<List<String>> getLanguageNames() {
    final languajesLS = [languageName_en, languageName_es, languageName_fr];

    final languajes = languajesLS.map((item) {
      return item.split(', ').toList();
    }).toList();

    return languajes;
  }

  List<String> getLanguage(String languajeCode) {
    final languajes = getLanguageNames();

    final languaje = languajes.firstWhere((value) => value[0] == languajeCode);

    return languaje;
  }
}
