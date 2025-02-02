import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';

class InformationComponent extends StatelessWidget {
  const InformationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          l10n.enter_phone_number,
          style: const TextStyle(fontSize: 24),
          textAlign: TextAlign.center,
        ),
        const SizedBox(
          height: 8,
        ),
        RichTextWithLinks(
          textAlign: TextAlign.center,
          message: l10n.whatsapp_verification(l10n.whats_my_number),
          keywords: {
            l10n.whats_my_number: () {},
          },
          textSpanStyle: const TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Colors.white,
          ), // Personaliza el estilo del texto
          textSpanlinkStyle: const TextStyle(
            fontSize: 15,
            height: 1.4,
            color: Color.fromARGB(255, 58, 193, 247),
          ), // Personaliza el estilo del enlace
        ),
      ],
    );
  }
}
