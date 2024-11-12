import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';
import 'dart:ui' as ui;

import 'package:buycar/domain/invoice.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:path_provider/path_provider.dart';
import 'package:share_plus/share_plus.dart';

//Se cobran $2000 la traida
//
class InvoiceScreen extends StatefulWidget {
  const InvoiceScreen({super.key});

  @override
  State<InvoiceScreen> createState() => _InvoiceScreenState();
}

class _InvoiceScreenState extends State<InvoiceScreen> {
  GlobalKey _globalKey = GlobalKey();
  Invoice invoice = Invoice(
    client: '',
    vehicleData: '',
    lot: '',
    stateUsa: '',
    bidPrice: 0,
    ship: 0,
    transfers: 0,
    documents: 0,
    poliza: 0,
    placas: 0,
    tramitePlacas: 0,
    titleAndCard: 0,
    comission: 0,
  );

  Future<void> _captureAndSharePng() async {
    log('Si entro');
    try {
      RenderRepaintBoundary boundary = _globalKey.currentContext
          ?.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage();
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);
      if (byteData != null) {
        final buffer = byteData.buffer.asUint8List();

        // Save the image to a temporary directory
        final directory = await getTemporaryDirectory();
        final imagePath = '${directory.path}/text_image.png';
        File(imagePath).writeAsBytesSync(buffer);

        // Share the image
        await Share.shareXFiles([XFile(imagePath)],
            text: 'Check out this image');
      }
    } catch (e) {
      log('Error capturing image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    invoice = ModalRoute.of(context)!.settings.arguments as Invoice;
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: EdgeInsets.all(30),
      child: RepaintBoundary(
        key: _globalKey,
        child: Column(
          children: [
            Text('${invoice.client}'),
            Text('${invoice.vehicleData}'),
            Text('${invoice.lot}'),
            Text('${invoice.stateUsa}'),
            Text('${invoice.bidPrice}'),
            _widgetTaxes(title: 'Barco y grua', value: '\$ ${invoice.ship}'),
            _widgetTaxes(
                title: 'Transferencias', value: '\$ ${invoice.transfers}'),
            _widgetTaxes(title: 'Papeleria', value: '\$ ${invoice.documents}'),
            _widgetTaxes(
                title: 'Almacenaje, poliza y grua',
                value: '\$ ${invoice.poliza}'),
            _widgetTaxes(title: 'Placas', value: '\$ ${invoice.placas}'),
            _widgetTaxes(
                title: 'Tramite placas', value: '\$ ${invoice.tramitePlacas}'),
            _widgetTaxes(
                title: 'Titulo y tarjeta', value: '\$ ${invoice.titleAndCard}'),
            _widgetTaxes(title: 'Comision', value: '\$ ${invoice.comission}'),
            OutlinedButton(
              onPressed: () => _captureAndSharePng(),
              child:
                  Container(width: 100, child: Center(child: Text('Imprimir'))),
            ),
          ],
        ),
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
}
