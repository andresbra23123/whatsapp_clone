import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/components/body_phone_auth_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/providers/phone_auth_provider.dart';

class PhoneAuthScreen extends StatefulWidget {
  const PhoneAuthScreen({super.key});

  @override
  State<PhoneAuthScreen> createState() => _PhoneAuthScreenState();
}

class _PhoneAuthScreenState extends State<PhoneAuthScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ChangeNotifierProvider(
      create: (context) => PhoneAuthProvider(l10n: l10n),
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(Icons.more_vert),
          tooltip: 'More options',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: const BodyPhoneAuthComponent(),
      ),
    );
  }
}
