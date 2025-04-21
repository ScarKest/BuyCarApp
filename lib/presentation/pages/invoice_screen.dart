// ignore_for_file: cast_nullable_to_non_nullable
import 'dart:developer';

import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:flutter/material.dart';

class InvoiceCopartScreen extends StatefulWidget {
  const InvoiceCopartScreen({super.key});

  @override
  State<InvoiceCopartScreen> createState() => _InvoiceCopartScreenState();
}

class _InvoiceCopartScreenState extends State<InvoiceCopartScreen> {
  TextEditingController controller = TextEditingController();
  double totalTaxes = 0.0;
  double total = 0.0;

  String virtualFee = '';
  String gateFee = '';
  String titlePickupFee = '';
  String buyerFee = '';
  String salePrice = '';
  bool isVisible = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Valores del carro'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            TextField(
              keyboardType: TextInputType.number,
              controller: controller,
              decoration: const InputDecoration(
                icon: Icon(Icons.car_crash),
                label: Text('Precio de Vehiculo'),
              ),
            ),
            TextButton(
              onPressed: () => invoiceCalculate(controller.text),
              child: Text('Calcular', style: TextStyle(fontSize: 30)),
            ),
            // TextField(
            //   decoration: InputDecoration(
            //     icon: Icon(Icons.eco_outlined),
            //     label: Text('Enviroment Fee \$$enviromentFee'),
            //   ),
            //   enabled: false,
            // ),
            SizedBox(
              height: 20,
            ),

           ...(isVisible) ? _showWidgets() : [Container()],
          ],
        ),
      ),
    );
  }

  List<Widget> _showWidgets() {
    return [
      TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.money),
          label: Text('Virtual Fee \$${virtualFee.toString()}'),
        ),
        enabled: false,
      ),
      TextField(
        decoration: InputDecoration(
          icon: const Icon(Icons.car_crash),
          label: Text('Buyer Fee \$${buyerFee.toString()}'),
        ),
        enabled: false,
      ),
      TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.car_crash),
          label: Text('Gate \$$gateFee'),
        ),
        enabled: false,
      ),
      TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.car_crash),
          label: Text('Total Taxes \$$totalTaxes'),
        ),
        enabled: false,
      ),
      Container(
        padding: EdgeInsets.all(50),
        child: Text(
          'Total: \$$total',
          style: TextStyle(fontSize: 30),
        ),
      )
    ];
  }

  invoiceCalculate(String price) async {
    await calculateTotal(
      price: double.parse(price),
      titleType: 'clean_title',
      isSecurePayment: false,
      isPreBidFee: false,
    ).then((value) {
      log(value.toString());
      setState(() {
        virtualFee = value['detalle']['live_bid_fees'].toString();
        gateFee = value['detalle']['Gate Fee'].toString();
        titlePickupFee = value['detalle']['Title PickUp'].toString();
        buyerFee = value['detalle']['Bidding Fee'].toString();
        totalTaxes = double.parse(value['total'].toString());
        total = double.parse(price) + double.parse(value['total'].toString());
        isVisible = true;
      });
    });
  }
}
