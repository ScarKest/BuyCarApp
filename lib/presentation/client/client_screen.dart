import 'dart:convert';

import 'package:buycar/data/models/grua_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  //Controladores de texto
  TextEditingController priceController = TextEditingController();
  TextEditingController gruaController = TextEditingController();
  TextEditingController barcoController = TextEditingController();
  //Variables para calcular
  double precio = 0;
  double grua = 0;
  double barco = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: ListView(
        padding: const EdgeInsets.all(100),
        children: [
          _field('Precio del carro', priceController),
          _field('Precio de la Grua', gruaController),
          _field('Precio del barco', barcoController),
          Text('Precio ${_calculate().toString()}'),
          ElevatedButton(
            onPressed: () => setState(() {
              precio = double.parse(priceController.text);
              grua = double.parse(gruaController.text);
              barco = double.parse(barcoController.text);
            }),
            child: const Text('Cotizar'),
          )
        ],
      ),
    );
  }

  Widget _field(String title, TextEditingController _controller) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 30)),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _controller,
          ),
        ),
      ],
    );
  }

  Future<double> _calculate() async {
    final response = await rootBundle.loadString('assets/data/barco.json');
    // var barcoJson = barcoFromJson(response);
    // print(barcoJson);
    return grua + barco + precio;
  }
}
