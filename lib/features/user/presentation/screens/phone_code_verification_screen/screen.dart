import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/components/body_phone_code_verificarion_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/providers/phone_code_verificarion_provider.dart';

class PhoneCodeVerificationScreen extends StatelessWidget {
  const PhoneCodeVerificationScreen({required this.phoneNumber, super.key});
  final String phoneNumber;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          PhoneCodeVerificarionProvider(phoneNumber: phoneNumber),
      child: Scaffold(
        floatingActionButton: IconButton(
          onPressed: () {},
          icon: const Icon(
            Icons.more_vert,
          ),
          tooltip: 'More options',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
        body: const BodyPhoneVerificationComponent(),
      ),
    );
  }
}
