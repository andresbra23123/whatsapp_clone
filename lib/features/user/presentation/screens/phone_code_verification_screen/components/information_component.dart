import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/providers/phone_code_verificarion_provider.dart';

class InformationComponent extends StatelessWidget {
  const InformationComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final phoneNumber =
        context.read<PhoneCodeVerificarionProvider>().phoneNumber;
    return Column(
      children: [
        const SizedBox(
          height: 50,
        ),
        Text(
          l10n.verify_phone_number,
          style: const TextStyle(fontSize: 24),
        ),
        const SizedBox(
          height: 8,
        ),
        RichTextWithLinks(
          textAlign: TextAlign.center,
          message: l10n.waiting_for_sms(phoneNumber, l10n.wrong_number),
          keywords: {
            l10n.wrong_number: () {
              context.pop();
            },
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
