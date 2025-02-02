import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/cubit/cubits.dart';
import 'package:whatsapp_clone/features/global/presentation/functions/funtions.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      floatingActionButton: IconButton(
        onPressed: () {},
        icon: const Icon(
          Icons.more_vert,
        ),
        tooltip: 'More options',
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
          child: Column(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Image.asset(
                    'assets/images/backgrounds/bg_image_1.png',
                    fit: BoxFit.contain,
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      l10n.welcomeMessage,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 28),
                    ),
                    RichTextWithLinks(
                      textAlign: TextAlign.center,
                      message: l10n.termsAndConditionsMessage(
                        l10n.privacyPolicy,
                        l10n.termsConditions,
                      ),
                      keywords: {
                        l10n.privacyPolicy: () {
                          customLog('Privacy Policy');
                        },
                        l10n.termsConditions: () {
                          customLog('Terms and Conditions');
                        },
                      },
                      textSpanStyle: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: AppThemeColors.textColor,
                      ), // Personaliza el estilo del texto
                      textSpanlinkStyle: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color.fromARGB(255, 58, 193, 247),
                      ), // Personaliza el estilo del enlace
                    ),
                    RichTextWithLinks(
                      textAlign: TextAlign.center,
                      message: l10n.accountInfoMessage(l10n.learnMore),
                      keywords: {
                        l10n.learnMore: () {
                          customLog('Learn more');
                        },
                      },
                      textSpanStyle: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: AppThemeColors.textColor,
                      ), // Personaliza el estilo del texto
                      textSpanlinkStyle: const TextStyle(
                        fontSize: 14,
                        height: 1.4,
                        color: Color.fromARGB(255, 58, 193, 247),
                      ), // Personaliza el estilo del enlace
                    ),
                    BlocBuilder<PreferencesCubit, PreferencesState>(
                      builder: (context, state) {
                        final languages = context.l10n
                            .getLanguageNames(); // Obtiene los idiomas

                        return TextButton(
                          onPressed: () {
                            languageShowModalBottomSheet(
                              context,
                              l10n,
                              languages,
                              state,
                            );
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              const Icon(
                                Icons.language,
                                color: AppThemeColors.greenColorOne,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8),
                                child: Text(
                                  l10n.getLanguage(state.languageCode).last,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: AppThemeColors.greenColorOne,
                                  ),
                                ),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down,
                                color: AppThemeColors.greenColorOne,
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                    ContinueButtomWidget(
                      text: l10n.agreeAndContinue,
                      onPressed: () async {
                        context.go('/phoneVerification');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
