import 'package:buycar/utils/calculate_taxes.dart';
import 'package:flutter/material.dart';

class InvoiceWidget extends StatefulWidget {
  const InvoiceWidget({required this.user, super.key});

  final String user;

  @override
  State<InvoiceWidget> createState() => _InvoiceWidgetState();
}

class _InvoiceWidgetState extends State<InvoiceWidget> {
  //Precios que varian segun precio
  int virtualFee = 0;
  int buyerFee = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: const InputDecoration(
            icon: Icon(Icons.car_crash),
            label: Text('Precio de Vehiculo'),
          ),
          onSubmitted: (value) {
            setState(() {
              buyerFee = calculateBuyerFee(widget.user, int.parse(value));
              virtualFee = calculateVirtualFee(widget.user, int.parse(value));
            });
          },
        ),
        const TextField(
          decoration: InputDecoration(
            icon: Icon(Icons.eco_outlined),
            label: Text('Enviroment Fee'),
            hintText: r'$10',
          ),
          readOnly: true,
        ),
        TextField(
          decoration: InputDecoration(
            icon: const Icon(Icons.money),
            label: const Text('Virtual Fee'),
            hintText: virtualFee.toString(),
          ),
          readOnly: true,
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
    );
  }
}
