import 'package:buycar/data/datasource/quotations/remote_datasource_quotations.dart';
import 'package:buycar/data/models/quotations/quotation_model.dart';
import 'package:buycar/utils/calculates/invoice_calculate.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class VehiculeScreen extends StatefulWidget {
  const VehiculeScreen({super.key});

  @override
  State<VehiculeScreen> createState() => _VehiculeScreenState();
}

class _VehiculeScreenState extends State<VehiculeScreen> {
  final TextEditingController clientControler = TextEditingController();
  final TextEditingController telephoneControler = TextEditingController();
  final TextEditingController lotControler = TextEditingController();
  final TextEditingController carControler = TextEditingController();
  final TextEditingController priceControler = TextEditingController();
  final TextEditingController stateControler = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Vehiculos'),
      ),
      body: _bodyWidget(),
    );
  }

  Widget _bodyWidget() {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 30),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              TextFormField(
                decoration: InputDecoration(label: Text('Cliente')),
                textCapitalization: TextCapitalization.words,
                controller: clientControler,
                validator: _validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Telefono')),
                textCapitalization: TextCapitalization.words,
                controller: telephoneControler,
                keyboardType: TextInputType.number,
                validator: _validator,
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Marca, modelo y año')),
                textCapitalization: TextCapitalization.words,
                controller: carControler,
                validator: _validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Lote')),
                controller: lotControler,
                keyboardType: TextInputType.number,
                validator: _validator,
                inputFormatters: [LengthLimitingTextInputFormatter(8)],
              ),
              SizedBox(height: 10),
              // _dropDownStates(),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Puja de Carro')),
                controller: priceControler,
                keyboardType: TextInputType.number,
                validator: _validator,
              ),
              SizedBox(height: 60),
              ElevatedButton(
                onPressed: () => (_formKey.currentState!.validate())
                    ? _pushToInvoiceScreen()
                    : null,
                child: SizedBox(
                  width: double.infinity,
                  height: 60,
                  child: Center(
                    child: Text(
                      'Cotizar',
                      style: TextStyle(fontSize: 24),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) =>
      (value == null || value.isEmpty) ? 'Este campo no puede ir vacio' : null;

  _pushToInvoiceScreen() {
    QuotationModel quotation = QuotationModel(
      client: clientControler.text,
      telephone: double.parse(telephoneControler.text),
      vehicleData: carControler.text,
      lot: double.parse(lotControler.text),
      stateUsa: stateControler.text,
      bidPrice: double.parse(priceControler.text),
      ship: 2000,
      poliza: 20,
      transfers: 50,
      documents: 20,
      placas: 20,
      tramitePlacas: 40,
      titleAndCard: 20,
      comission: 255,
      totalD: getTotal(
        bidPrice: double.parse(priceControler.text),
        cleanTitleValue: false,
        internetFeeValue: false,
      ),
      totalQ: getTotal(
            bidPrice: double.parse(priceControler.text),
            cleanTitleValue: false,
            internetFeeValue: false,
          ) *
          8,
    );

    addQuotation(quotation).then(
      (quote) => Navigator.pushNamed(
        context,
        '/invoice',
        arguments: quotation,
      ),
    );
  }
}
