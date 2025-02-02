import 'package:country_codes/country_codes.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_clone/core/core.dart';

class PhoneAuthProvider extends ChangeNotifier {
  PhoneAuthProvider({required this.l10n}) {
    initControllers();
  }

  final AppLocalizations l10n;

  late TextEditingController countryNameController;
  late TextEditingController countryCodeController;
  late TextEditingController phoneNumberController;

  void initControllers() {
    countryNameController = TextEditingController(text: l10n.chooseCountry);
    countryCodeController = TextEditingController();
    phoneNumberController = TextEditingController();
  }

  bool _hasInvalidCountryCode = false;
  bool _moveToPhoneField = false;

  bool get hasInvalidCountryCode => _hasInvalidCountryCode;
  bool get moveToPhoneField => _moveToPhoneField;

  set hasInvalidCountryCode(bool value) {
    _hasInvalidCountryCode = value;
    notifyListeners();
  }

  set moveToPhoneField(bool value) {
    _moveToPhoneField = value;
    notifyListeners();
  }

  void getCountryName() {
    final inputCode = countryCodeController.text.trim();
    hasInvalidCountryCode = false;
    if (inputCode.isEmpty) {
      countryNameController.text = l10n.chooseCountry;
      return;
    }
    try {
      final country = CountryCodes.countryCodes().firstWhere(
        (element) {
          return element.dialCode == '+$inputCode';
        },
      );
      countryNameController.text = country.localizedName!;
      phoneNumberController.text = '';
      moveToPhoneField = true;
    } catch (e) {
      countryNameController.text = l10n.invalidCountryCode;
      hasInvalidCountryCode = true;
      moveToPhoneField = false;
    }
  }

  String? validatePhoneNumber() {
    final countryName = countryNameController.text;
    final countryCode = countryCodeController.text.trim();
    final phoneNumber = phoneNumberController.text.trim();

    if (countryCode.isEmpty) {
      return l10n.invalidCountryCodeLength;
    }

    if (hasInvalidCountryCode) {
      return l10n.invalidCountryCode;
    }

    if (phoneNumber.isEmpty) {
      return l10n.emptyPhoneNumber;
    }

    if (phoneNumber.length < 10) {
      return l10n.shortPhoneNumber(countryName);
    }

    if (phoneNumber.length > 10) {
      return l10n.longPhoneNumber(countryName);
    }

    return null;
  }

  @override
  void dispose() {
    countryNameController.dispose();
    countryCodeController.dispose();
    phoneNumberController.dispose();
    super.dispose();
  }
}
