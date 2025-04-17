// ignore_for_file: cast_nullable_to_non_nullable
import 'dart:developer';

import 'package:buycar/utils/calculate_virtual_bid_fee.dart';
import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:buycar/utils/clean_title/buyer_fee.dart';
import 'package:flutter/material.dart';

class InvoiceCopartScreen extends StatefulWidget {
  const InvoiceCopartScreen({super.key});

  @override
  State<InvoiceCopartScreen> createState() => _InvoiceCopartScreenState();
}

class _InvoiceCopartScreenState extends State<InvoiceCopartScreen> {

  TextEditingController controller = TextEditingController();
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
              controller: controller,
              decoration: const InputDecoration(
                icon: Icon(Icons.car_crash),
                label: Text('Precio de Vehiculo'),
              ),
            ),
            TextButton(onPressed: ()=> invoice_calculate(controller.text), child: Text('Calcular'))
              // TextField(
              //   decoration: InputDecoration(
              //     icon: Icon(Icons.eco_outlined),
              //     label: Text('Enviroment Fee \$$enviromentFee'),
              //   ),
              //   enabled: false,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     icon: const Icon(Icons.money),
              //     label: Text('Virtual Fee \$${virtualFee.toString()}'),
              //   ),
              //   enabled: false,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     icon: const Icon(Icons.car_crash),
              //     label: Text('Buyer Fee \$${buyerFee.toString()}'),
              //   ),
              //   enabled: false,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     icon: Icon(Icons.car_crash),
              //     label: Text('Gate \$$gateFee'),
              //   ),
              // ),
              // Container(
              //   padding: EdgeInsets.all(50),
              //   child: Text('Total: \$$totalPrice'),
              // )
          ],
        ),
      ),
    );
  }

  invoice_calculate(String price) async {
    var total = await calculateTotal(
      price: double.parse(price),
      titleType: 'clean_title',
      isSecurePayment: true,
      isPreBidFee: true,
    ).then((value) => value['total']);
    log('Totalitario : $total');
  }

  int getTotalPrice(
    int virtualFee,
    int buyerFee,
    int enviromentFee,
    int gateFee,
  ) =>
      virtualFee + buyerFee + enviromentFee + gateFee;
}
