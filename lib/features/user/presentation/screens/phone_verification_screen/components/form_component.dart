import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:whatsapp_clone/core/core.dart';
import 'package:whatsapp_clone/features/user/presentation/screens/phone_verification_screen/providers/phone_auth_provider.dart';
import 'package:whatsapp_clone/features/user/presentation/widgets/widgets.dart';

class FormComponent extends StatefulWidget {
  const FormComponent({super.key});

  @override
  State<FormComponent> createState() => _FormComponentState();
}

class _FormComponentState extends State<FormComponent> {
  void _buildShowCountryPicker() {
    final phoneAuthProvider = context.read<PhoneAuthProvider>();
    showCountryPicker(
      context: context,
      showPhoneCode: true,
      countryListTheme: const CountryListThemeData(
        flagSize: 25,
        backgroundColor: AppThemeColors.backgroundColor,
        textStyle: TextStyle(
          fontSize: 16,
          color: Colors.white,
        ),
      ),
      onSelect: (Country country) {
        phoneAuthProvider.countryNameController.text = country.name;
        phoneAuthProvider.countryCodeController.text = country.phoneCode;
        phoneAuthProvider.phoneNumberController.text = '';
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final phoneAuthProvider = context.read<PhoneAuthProvider>();

    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: 40,
        vertical: 16,
      ),
      child: Column(
        spacing: 10,
        children: [
          CustomTextField(
            controller: phoneAuthProvider.countryNameController,
            trailingIcon: const Icon(
              Icons.arrow_drop_down_sharp,
              size: 25,
              color: AppThemeColors.greenColorOne,
            ),
            readOnly: true,
            onTap: _buildShowCountryPicker,
          ),
          Row(
            spacing: 10,
            children: [
              Expanded(
                child: CustomTextField(
                  autoFocus: true,
                  controller: phoneAuthProvider.countryCodeController,
                  textAlign: TextAlign.justify,
                  maxLength: 3,
                  textInputType: TextInputType.number,
                  prefixIcon: const Text('+'),
                  onChanged: (p0) {
                    phoneAuthProvider.getCountryName();
                  },
                ),
              ),
              Expanded(
                flex: 3,
                child: CustomTextField(
                  controller: phoneAuthProvider.phoneNumberController,
                  hintText: 'Phone number',
                  textAlign: TextAlign.justify,
                  maxLength: 17,
                  textInputType: TextInputType.phone,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
