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
      body: Column(
        children: [
          _widgetTaxes(title: 'SALE PRICE', value: ''),
          _widgetTaxes(title: 'ENVIRONMENTAL FEE', value: ''),
          _widgetTaxes(title: 'BUYER FEE', value: ''),
          _widgetTaxes(title: 'INTERNET BID FEE', value: ''),
          _widgetTaxes(title: 'GATE', value: ''),
          _widgetTaxes(title: 'TITLE PICKUP FEE', value: ''),
        ],
      ),
    );
  }

  Widget _widgetTaxes({String title = '', String value = ''}) {
    return Row(
      children: [
        Text(title),
        Expanded(child: Container()),
        Text(value),
      ],
    );
  }
}
