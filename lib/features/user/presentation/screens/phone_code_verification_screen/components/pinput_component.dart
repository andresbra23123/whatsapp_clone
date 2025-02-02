import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:pinput/pinput.dart';
import 'package:provider/provider.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_code_verification_screen/providers/phone_code_verificarion_provider.dart';

class PinputComponent extends StatelessWidget {
  const PinputComponent({super.key});

  @override
  Widget build(BuildContext context) {
    final phoneAuthProvider = context.read<PhoneCodeVerificarionProvider>();
    final userAuthCubit = context.read<UserAuthCubit>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 16,
      ),
      child: Pinput(
        length: 6,
        autofocus: true,
        controller: phoneAuthProvider.pinputController,
        defaultPinTheme: const PinTheme(
          width: 22,
          height: 56,
          textStyle: TextStyle(
            fontSize: 22,
            color: Colors.white,
          ),
        ),
        preFilledWidget: const Icon(
          Icons.remove,
          size: 10,
          color: Colors.white,
        ),
        separatorBuilder: (index) =>
            (index == 2) ? const SizedBox(width: 10) : const SizedBox.shrink(),
        onCompleted: (value) async {
          await _verifyOtp(userAuthCubit, value, context);
        },
        onSubmitted: (value) async => _verifyOtp(userAuthCubit, value, context),
      ),
    );
  }

  Future<void> _verifyOtp(
    UserAuthCubit userAuthCubit,
    String value,
    BuildContext context,
  ) async {
    await userAuthCubit.validateOtpAndSignIn(otp: value);

    if (userAuthCubit.state is UserAuthFailure) {
      return showErrorDialog(
        context,
        (userAuthCubit.state as UserAuthFailure).message,
      );
    }
    context.go('/initialProfileSubmitScreen');
  }
}
