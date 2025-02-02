import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:phone_numbers_parser/phone_numbers_parser.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/global/presentation/widgets/widget.dart';
import 'package:whatsapp_clone/features/user/presentation/cubits/user_auth/user_auth_cubit.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/providers/phone_auth_provider.dart';

class ActiotionButtomComponent extends StatefulWidget {
  const ActiotionButtomComponent({super.key});

  @override
  State<ActiotionButtomComponent> createState() =>
      _ActiotionButtomComponentState();
}

class _ActiotionButtomComponentState extends State<ActiotionButtomComponent> {
  Future<void> sendCodeToPhone() async {
    final phoneAuthProvider = context.read<PhoneAuthProvider>();

    // Validar el número de teléfono
    final validationError = phoneAuthProvider.validatePhoneNumber();
    if (validationError != null) {
      return showErrorDialog(context, validationError);
    }

    // Confirmar número de teléfono
    final isConfirmed = await _showPhoneNumberConfirmationDialog();

    if (isConfirmed != null) {
      await _navigateToPhoneCodeVerification();
    }
  }

  Future<bool?> _showPhoneNumberConfirmationDialog() async {
    final l10n = context.l10n;

    final phoneAuthProvider = context.read<PhoneAuthProvider>();

    final countryCode = phoneAuthProvider.countryCodeController.text.trim();
    final phoneNumber = phoneAuthProvider.phoneNumberController.text.trim();

    return showAlertDialog<bool>(
      context: context,
      barrierDismissible: false,
      customContenTextShowAlertDialog: CustomContenTextShowAlertDialog(
        message: l10n.is_this_correct_number,
      ),
      content: [
        Padding(
          padding: const EdgeInsets.only(top: 10),
          child: CustomContenTextShowAlertDialog(
            message: PhoneNumber.parse('$countryCode$phoneNumber').formatNsn(),
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
      actions: [
        CustomActionButtonsShowAlertDialog(
          message: l10n.edit,
          funtion: () => context.pop(),
        ),
      ],
      customActionButtonsShowAlertDialog: CustomActionButtonsShowAlertDialog(
        message: l10n.yes,
        funtion: () => context.pop(true),
      ),
    );
  }

  Future<void> _navigateToPhoneCodeVerification() async {
    final phoneAuthProvider = context.read<PhoneAuthProvider>();
    final userAuthCubit = context.read<UserAuthCubit>();

    final countryCode = phoneAuthProvider.countryCodeController.text.trim();
    final phoneNumber = phoneAuthProvider.phoneNumberController.text.trim();

    await userAuthCubit.initiatePhoneNumberVerification(
      phoneNumber: '+$countryCode$phoneNumber',
    );

    if (!mounted) return;

    if (userAuthCubit.state is UserAuthFailure) {
      return showErrorDialog(
        context,
        (userAuthCubit.state as UserAuthFailure).message,
      );
    }

    await context.pushNamed(
      'phoneCodeVerification',
      extra: {'phoneNumber': '+$countryCode $phoneNumber'},
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return ContinueButtomWidget(
      text: l10n.next,
      onPressed: sendCodeToPhone,
    );
  }
}
