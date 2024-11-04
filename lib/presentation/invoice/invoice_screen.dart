import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:buycar/domain/invoice.dart';
import 'package:buycar/utils/taxes_fee/clean_title_taxes.dart';
import 'package:buycar/utils/taxes_fee/non_clean_title_taxes.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';


//Se cobran $2000 la traida 
//
class CalculateInvoiceScreen extends StatefulWidget {
  const CalculateInvoiceScreen({super.key});

  @override
  State<CalculateInvoiceScreen> createState() => _CalculateInvoiceScreenState();
}

class _CalculateInvoiceScreenState extends State<CalculateInvoiceScreen> {
  final TextEditingController lotControler = TextEditingController();
  final TextEditingController priceControler = TextEditingController();
  bool cleanTitleValue = false;
  bool internetFeeValue = false;
  double totalInvoice = 0;
  ScreenshotController screenshotController = ScreenshotController();
  Invoice invoice = Invoice(
    price: 0,
    buyerFee: 0,
    internetBidFee: 0,
    titlePickup: 0,
  );
  GlobalKey _globalKey = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
      body: Screenshot(controller: screenshotController, child: _bodyWidget()),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: Column(
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
          SwitchListTile(
            title: Text('Compra ya'),
            value: internetFeeValue,
            onChanged: (newValue) =>
                setState(() => internetFeeValue = newValue),
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
            onPressed: () => _takeScreenshot(),
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
            invoice.titlePickup;
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
            invoice.titlePickup;
      }
    });
  }

  _takeScreenshot() async {
    await screenshotController
        .captureFromLongWidget(
            InheritedTheme.captureAll(
              context,
              Material(
                child: _bodyWidget(),
              ),
            ),
            delay: Duration(milliseconds: 100),
            context: context)
        .then((capturedImage) {
      _saveLocalImage();
    });
  }

  _saveLocalImage() async {
    RenderRepaintBoundary boundary =
        _globalKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
    ui.Image image = await boundary.toImage();
    ByteData? byteData =
        await (image.toByteData(format: ui.ImageByteFormat.png));
    if (byteData != null) {
      final result =
          await ImageGallerySaver.saveImage(byteData.buffer.asUint8List());
      print(result);
    }
  }
}
