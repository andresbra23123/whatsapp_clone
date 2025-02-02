import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class ResendCodeButton extends StatelessWidget {
  const ResendCodeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return TextButton(
      onPressed: () {
        // todo: realizar implementacion para renviar mensaje
      },
      child: Text(
        l10n.did_not_receive_code,
        style: const TextStyle(
          color: AppThemeColors
              .greenColorOne, // Color desde el tema (puedes modificarlo)
        ),
      ),
    );
  }
}
