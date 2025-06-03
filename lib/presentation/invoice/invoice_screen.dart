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
      lot: 0,
      stateUsa: '',
      bidPrice: 0,
      ship: 0,
      poliza: 0,
      totalD: 0,
      detailFees: {
        'fee': 0,
      });

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
          SizedBox(
            height: 50,
          )
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
            // Text('Carro: ${invoice.vehicleData}', style: _textStyle),
            // Text('Lote: https://www.copart.com/lot/${invoice.lot}',
            //     style: _textStyle),
            // Text('Estado: ${invoice.stateUsa}', style: _textStyle),
            Text('Puja de Carro: ${invoice.bidPrice}', style: _textStyle),
            ...detailFeesWidget(),
            SizedBox(height: 15),
            _buildCard('Total en \$ ',invoice.totalD, highlight = true)
            _buildCard('Total en Q ',invoice.totalD * 7.9, highlight = true)
            // Text('Total en \$ ${invoice.totalD}', style: _totalTextStyle),
            // Text('Total en Q ${invoice.totalD * 7.9}', style: _totalTextStyle),
            SizedBox(height: 15),
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

  Widget _buildCard(String title, double amount, {bool highlight = false}) {
    return Card(
      color: highlight ? Colors.deepPurple[100] : Colors.white,
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: const Icon(Icons.directions_car),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.bold)),
        trailing: Text(formatter.format(amount),
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: highlight ? Colors.deepPurple : Colors.black,
            )),
      ),
    );
  }

  List<Widget> detailFeesWidget() {
    List<Widget> widgets = [];

    invoice.detailFees.forEach(
      (key, value) => widgets.add(
        _widgetTaxes(title: key, value: '\$ $value'),
      ),
    );

    return widgets;
  }
}
