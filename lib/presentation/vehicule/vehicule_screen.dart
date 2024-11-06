import 'dart:typed_data';
import 'dart:ui' as ui;
import 'package:buycar/domain/invoice.dart';
import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

//Se cobran $2000 la traida
//
class VehiculeScreen extends StatefulWidget {
  const VehiculeScreen({super.key});

  @override
  State<VehiculeScreen> createState() => _VehiculeScreenState();
}

class _VehiculeScreenState extends State<VehiculeScreen> {
  final TextEditingController clientControler = TextEditingController();
  final TextEditingController lotControler = TextEditingController();
  final TextEditingController carControler = TextEditingController();
  final TextEditingController yearControler = TextEditingController();
  final TextEditingController priceControler = TextEditingController();
  final TextEditingController stateControler = TextEditingController();

  bool cleanTitleValue = false;
  bool internetFeeValue = false;
  double totalInvoice = 0;
  double total = 0;
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
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextFormField(
              decoration: InputDecoration(label: Text('Cliente')),
              controller: clientControler,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('Marca, modelo y año')),
              controller: carControler,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('Lote')),
              controller: lotControler,
              keyboardType: TextInputType.number,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('Estado')),
              controller: stateControler,
            ),
            TextFormField(
              decoration: InputDecoration(label: Text('Puja de Carro')),
              controller: priceControler,
              keyboardType: TextInputType.number,
            ),
            _widgetTaxes(title: 'Transferencias', value: '50'),
            _widgetTaxes(title: 'Papeleria', value: '\$ 20'),
            _widgetTaxes(title: 'Almacenaje, poliza y grua', value: '\$ 250'),
            _widgetTaxes(title: 'Placas', value: '\$ 2000'),
            _widgetTaxes(title: 'Titulo y tarjeta', value: '\$ 20'),
            _widgetTaxes(title: 'Comision', value: '\$ 255'),
            Text(total.toString()),
            _buttons(),
          ],
        ),
      ),
    );
  }

  Row _buttons() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        OutlinedButton(
          onPressed: () => _getTotal(),
          child: Container(width: 100, child: Center(child: Text('Cotizar'))),
        ),
        OutlinedButton(
          onPressed: () => _takeScreenshot(),
          child: Container(width: 100, child: Center(child: Text('Imprimir'))),
        )
      ],
    );
  }

  _getTotal() {
    setState(() {});
    total = getTotal(
        price: double.parse(priceControler.text),
        cleanTitleValue: cleanTitleValue,
        internetFeeValue: internetFeeValue,
        invoice: invoice,
        totalInvoice: totalInvoice);
  }

  Widget _widgetTaxes({
    String title = '',
    String value = '',
    List<Widget> widgets = const <Widget>[],
  }) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(10),
          child: Text(title),
        ),
        Expanded(child: Container()),
        Text(value),
        ...widgets,
      ],
    );
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
