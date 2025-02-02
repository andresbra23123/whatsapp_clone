import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';

Future<void> languageShowModalBottomSheet(
  BuildContext context,
  AppLocalizations l10n,
  List<List<String>> languages,
  PreferencesState state,
) {
  return showModalBottomSheet<void>(
    context: context,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(10),
        topRight: Radius.circular(10),
      ),
    ),
    backgroundColor: AppThemeColors.backgroundBottomSheetColor,
    builder: (BuildContext context) {
      return Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          const ShortBar(),
          ListTile(
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            leading: IconButton(
              onPressed: () => context.pop(),
              icon: const Icon(Icons.close),
            ),
            title: Text(
              l10n.appLanguage,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 20,
              ),
            ),
          ),
          const Divider(
            color: AppThemeColors.dividerColor,
          ),
          ListView.builder(
            physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: languages.length,
            itemBuilder: (context, index) {
              final language = languages[index];
              final languageCode = language[0];
              // Código del idioma (en, es, fr)

              return RadioListTile<String>(
                title: Text(
                  language[2],
                ), // Nombre del idioma
                subtitle: Text(
                  language[1],
                ), // Subtítulo (nombre corto)
                value: languageCode,
                groupValue: state.languageCode,
                // Valor seleccionado
                onChanged: (value) {
                  if (value != null) {
                    context.read<PreferencesCubit>().onChangeLanguage(value);
                  }
                  context.pop();
                },
              );
            },
          ),
        ],
      );
    },
  );
}
