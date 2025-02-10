import 'package:buycar/domain/invoice/quotation.dart';
import 'package:buycar/utils/capture_image/capture_image.dart';
import 'package:flutter/material.dart';

//Se cobran $2000 la traida
//
class QuotationScreen extends StatefulWidget {
  const QuotationScreen({super.key});

  @override
  State<QuotationScreen> createState() => _QuotationScreenState();
}

class _QuotationScreenState extends State<QuotationScreen> {
  final GlobalKey _globalKey = GlobalKey();
  final TextStyle _textStyle = TextStyle(fontSize: 20);
  final TextStyle _totalTextStyle =
      TextStyle(fontSize: 32, fontWeight: FontWeight.bold);
  Color color = Colors.white;
  Quotation invoice = Quotation(
    client: '',
    telephone: 0,
    vehicleData: '',
    lot:0,
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
    totalD: 0,
    totalQ: 0,
  );

  @override
  Widget build(BuildContext context) {
    invoice = ModalRoute.of(context)!.settings.arguments as Quotation;
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return SingleChildScrollView(
      child: Column(
        children: [
          _invoiceWidget(),
          OutlinedButton(
            onPressed: () => CaptureImage()
                .captureAndSharePng(globalKey: _globalKey, invoice: invoice),
            child: SizedBox(width: 100, child: Center(child: Text('Imprimir'))),
          ),
          SizedBox(height: 50,)
        ],
      ),
    );
  }

  Widget _invoiceWidget() {
    return RepaintBoundary(
      key: _globalKey,
      child: Container(
        padding: EdgeInsets.all(30),
        color: color,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.asset('assets/images/contac_us.png'),
            Text('Cliente: ${invoice.client}', style: _textStyle),
            Text('Carro: ${invoice.vehicleData}', style: _textStyle),
            Text('Lote: https://www.copart.com/lot/${invoice.lot}',
                style: _textStyle),
            Text('Estado: ${invoice.stateUsa}', style: _textStyle),
            Text('Puja de Carro: ${invoice.bidPrice}', style: _textStyle),
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
            SizedBox(height: 15),
            Text('Total en \$ ${invoice.totalD}', style: _totalTextStyle),
            SizedBox(height: 15),
            Text('Total en Q ${invoice.totalQ}', style: _totalTextStyle),
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
