import 'package:flutter/material.dart';

class VehiculeState {
  final formKey = GlobalKey<FormState>();
  final TextEditingController clientController;
  final TextEditingController telephoneController;
  final TextEditingController carController;
  final TextEditingController lotController;
  final TextEditingController priceController;
  final TextEditingController stateController;

  VehiculeState({
    required this.clientController,
    required this.telephoneController,
    required this.carController,
    required this.lotController,
    required this.priceController,
    required this.stateController,
  });

  factory VehiculeState.initial() {
    return VehiculeState(
      clientController: TextEditingController(),
      telephoneController: TextEditingController(),
      carController: TextEditingController(),
      lotController: TextEditingController(),
      priceController: TextEditingController(),
      stateController: TextEditingController(),
    );
  }
}
