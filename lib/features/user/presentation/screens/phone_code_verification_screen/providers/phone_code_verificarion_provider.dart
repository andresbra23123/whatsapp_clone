import 'package:flutter/material.dart';

class PhoneCodeVerificarionProvider extends ChangeNotifier {
  PhoneCodeVerificarionProvider({required this.phoneNumber}) {
    initControllers();
  }

  final String phoneNumber; // Inyectar localización

  late TextEditingController pinputController;

  void initControllers() {
    pinputController = TextEditingController();
  }
}
