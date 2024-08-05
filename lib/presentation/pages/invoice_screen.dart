// ignore_for_file: cast_nullable_to_non_nullable
import 'package:buycar/utils/calculate_virtual_bid_fee.dart';
import 'package:buycar/utils/clean_title/buyer_fee.dart';
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
  int enviromentFee = 10;
  int gateFee = 79;
  int totalPrice = 0;

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
              decoration: const InputDecoration(
                icon: Icon(Icons.car_crash),
                label: Text('Precio de Vehiculo'),
              ),
              onSubmitted: (value) {
                setState(() {
                  buyerFee =
                      calculateBuyerFeeOwnerCTitle(int.parse(value), 'Secure');
                  virtualFee = calculateVirtualFee(int.parse(value), 'PreBid');
                  totalPrice =int.parse(value) + getTotalPrice(virtualFee, buyerFee, enviromentFee, gateFee);
                });
              },
            ),
            TextField(
              decoration: InputDecoration(
                icon: Icon(Icons.eco_outlined),
                label: Text('Enviroment Fee \$$enviromentFee'),
              ),
              enabled: false,
            ),
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
            ),
            Container(
              padding: EdgeInsets.all(50),
              child: Text('Total: \$$totalPrice'),
            )
          ],
        ),
      ),
    );
  }

  int getTotalPrice(
    int virtualFee,
    int buyerFee,
    int enviromentFee,
    int gateFee,
  ) =>
      virtualFee + buyerFee + enviromentFee + gateFee;
}
