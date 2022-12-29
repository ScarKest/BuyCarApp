// ignore_for_file: cast_nullable_to_non_nullable

import 'package:buycar/utils/calculate_taxes.dart';
import 'package:flutter/material.dart';

class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  //Precios que varian segun precio
  int virtualFee = 0;
  int buyerFee = 0;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valores del carro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(
                icon: Icon(Icons.car_crash),
                label: Text('Precio de Vehiculo'),
              ),
              onSubmitted: (value) {
                setState(() {
                  buyerFee = calculateBuyerFee(user, int.parse(value));
                  virtualFee =
                      calculateVirtualFee(user, int.parse(value));
                });
              },
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.eco_outlined),
                label: Text(r'Enviroment Fee $10'),
              ),
              enabled: false,
            ),
            TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.money),
                label: Text('Virtual Fee ${virtualFee.toString()}'),
              ),
              enabled: false,
            ),
            TextField(
              decoration: InputDecoration(
                icon: const Icon(Icons.car_crash),
                label: const Text('Buyer Fee'),
                hintText: buyerFee.toString(),
              ),
              readOnly: true,
            ),
            const TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.car_crash),
                label: Text('Gate'),
                hintText: r'$79',
              ),
              readOnly: true,
            ),
          ],
        ),
      ),
    );
  }
}
