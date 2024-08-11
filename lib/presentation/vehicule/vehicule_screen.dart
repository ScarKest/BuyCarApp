import 'package:buycar/domain/invoice.dart';
import 'package:buycar/utils/taxes_fee/clean_title_taxes.dart';
import 'package:buycar/utils/taxes_fee/non_clean_title_taxes.dart';
import 'package:flutter/material.dart';

class VehiculeScreen extends StatefulWidget {
  const VehiculeScreen({super.key});

  @override
  State<VehiculeScreen> createState() => _VehiculeScreenState();
}

class _VehiculeScreenState extends State<VehiculeScreen> {
  final TextEditingController lotControler = TextEditingController();
  final TextEditingController priceControler = TextEditingController();
  bool cleanTitleValue = false;
  bool internetFeeValue = false;
  double totalInvoice = 0;
  Invoice invoice = Invoice(
    price: 0,
    buyerFee: 0,
    internetBidFee: 0,
    titlePickup: 0,
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
      body: ListView(
        padding: EdgeInsets.all(30),
        children: [
          _widgetTaxes(title: 'Lote', value: ''),
          TextFormField(
            controller: lotControler,
            keyboardType: TextInputType.number,
          ),
          SwitchListTile(
            title: Text('Clean title'),
            value: cleanTitleValue,
            onChanged: (newValue) => setState(() => cleanTitleValue = newValue),
            activeColor: Colors.brown,
          ),
          _widgetTaxes(title: 'SALE PRICE', value: '\$ ${invoice.price}'),
          TextFormField(
            controller: priceControler,
            keyboardType: TextInputType.number,
          ),
          _widgetTaxes(
              title: 'ENVIRONMENTAL FEE',
              value: '\$ ${invoice.enviromentalFee}'),
          _widgetTaxes(
            title: 'BUYER FEE',
            value: '\$ ${invoice.buyerFee}',
          ),
          SwitchListTile(
            title: Text('Compra ya'),
            value: internetFeeValue,
            onChanged: (newValue) =>
                setState(() => internetFeeValue = newValue),
            activeColor: Colors.brown,
          ),
          _widgetTaxes(
            title: 'INTERNET BID FEE',
            value: '\$ ${invoice.internetBidFee}',
          ),
          _widgetTaxes(
            title: 'GATE',
            value: '\$ ${invoice.gate}',
          ),
          _widgetTaxes(
            title: 'TITLE PICKUP FEE',
            value: '\$ ${invoice.titlePickup}',
          ),
          SizedBox(height: 20),
          _widgetTaxes(
            title: 'TOTAL',
            value: '\$ $totalInvoice',
          ),
          OutlinedButton(
            onPressed: () => getTaxes(double.parse(priceControler.text)),
            child: Text('Cotizar'),
          ),
          OutlinedButton(
            onPressed: () {},
            child: Text('Imprimir'),
          )
        ],
      ),
    );
  }

  Widget _widgetTaxes({String title = '', String value = ''}) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(title),
        ),
        Expanded(child: Container()),
        Text(value),
      ],
    );
  }

  void getTaxes(double price) {
    setState(() {
      if (cleanTitleValue == true) {
        invoice = Invoice(
          price: price,
          buyerFee: CleanTitleTaxes().biddingFeeSecuredPayment(price),
          internetBidFee: (internetFeeValue == true)
              ? CleanTitleTaxes().virtualFeePreBid(price)
              : CleanTitleTaxes().virtualFeeLiveBid(price),
          titlePickup: 20,
        );
        totalInvoice = price +
            invoice.buyerFee +
            invoice.enviromentalFee +
            invoice.internetBidFee +
            invoice.gate +
            invoice.titlePickup!;
      } else {
        invoice = Invoice(
          price: price,
          buyerFee: NonCleanTitleTaxes().biddingFeeSecuredPayment(price),
          internetBidFee: (internetFeeValue == true)
              ? NonCleanTitleTaxes().virtualFeePreBid(price)
              : NonCleanTitleTaxes().virtualFeeLiveBid(price),
          titlePickup: 20,
        );
        totalInvoice = price +
            invoice.buyerFee +
            invoice.enviromentalFee +
            invoice.internetBidFee +
            invoice.gate +
            invoice.titlePickup!;
      }
    });
  }
}
