import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/components/actiotion_buttom_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/components/form_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/components/information_component.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/providers/phone_auth_provider.dart';

class BodyPhoneAuthComponent extends StatelessWidget {
  const BodyPhoneAuthComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<PhoneAuthProvider>(
      builder: (context, provider, _) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          if (provider.moveToPhoneField) {
            FocusScope.of(context).nextFocus();
            provider.moveToPhoneField = false; // Reiniciar el estado
          }
        });

        return const SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [InformationComponent(), FormComponent()],
                ),
                ActiotionButtomComponent(),
              ],
            ),
          ),
        );
      },
    );
  }
}
