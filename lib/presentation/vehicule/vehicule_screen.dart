import 'package:flutter/material.dart';

class VehiculeScreen extends StatefulWidget {
  const VehiculeScreen({super.key});

  @override
  State<VehiculeScreen> createState() => _VehiculeScreenState();
}

class _VehiculeScreenState extends State<VehiculeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
    );
  }
}