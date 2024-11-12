import 'package:buycar/domain/invoice.dart';
import 'package:flutter/material.dart';

class VehiculeScreen extends StatefulWidget {
  const VehiculeScreen({super.key});

  @override
  State<VehiculeScreen> createState() => _VehiculeScreenState();
}

class _VehiculeScreenState extends State<VehiculeScreen> {
  final TextEditingController clientControler = TextEditingController();
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
                controller: clientControler,
                validator: _validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Marca, modelo y año')),
                controller: carControler,
                validator: _validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Lote')),
                controller: lotControler,
                keyboardType: TextInputType.number,
                validator: _validator,
              ),
              SizedBox(height: 10),
              TextFormField(
                decoration: InputDecoration(label: Text('Estado')),
                controller: stateControler,
                validator: _validator,
              ),
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
                child: Container(
                    width: double.infinity,
                    height: 60,
                    child: Center(
                        child: Container(
                      child: Text(
                        'Cotizar',
                        style: TextStyle(fontSize: 24),
                      ),
                    ))),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? _validator(String? value) =>
      (value == null || value.isEmpty) ? 'Este campo no puede ir vacio' : null;

  _pushToInvoiceScreen() => Navigator.pushNamed(
        context,
        '/invoice',
        arguments: Invoice(
          client: clientControler.text,
          vehicleData: carControler.text,
          lot: lotControler.text,
          stateUsa: stateControler.text,
          bidPrice: double.parse(priceControler.text),
          ship: 2000,
          transfers: 50,
          documents: 20,
          poliza: 20,
          placas: 20,
          tramitePlacas: 40,
          titleAndCard: 20,
          comission: 255,
        ),
      );
}
