import 'package:flutter/material.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/components/information_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/components/pinput_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/components/resend_code_button.dart';

class BodyPhoneVerificationComponent extends StatelessWidget {
  const BodyPhoneVerificationComponent({super.key});
  @override
  Widget build(BuildContext context) {
    return const SafeArea(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
        child: Column(
          children: [
            InformationComponent(),
            PinputComponent(),
            ResendCodeButton(),
          ],
        ),
      ),
    );
  }
}
