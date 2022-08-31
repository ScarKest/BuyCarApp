import 'package:buycar/data/models/barco_model.dart';
import 'package:buycar/domain/barco.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  var barcosList = [];
  //Controladores de texto
  TextEditingController priceController = TextEditingController();
  TextEditingController gruaController = TextEditingController();
  TextEditingController barcoController = TextEditingController();
  //Variables para calcular
  double precio = 0;
  double grua = 0;
  double barco = 0;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  Future<void> _getData() async {
    final CollectionReference collectionReference =
        FirebaseFirestore.instance.collection('barco');
    final barcos = await collectionReference.get();
    if (barcos.docs.isNotEmpty) {
      var response = barcoModelFromMap(barcos.docs.toString());
      // for (final barco in barcos.docs) {
      //   print('Barco numero ${barco.id} ${barco.data()}');
      //   barcosList.add(barco.data());
      // }
      print('Lista de barcos ${response.precio}');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      // body: Container(),
      body: ListView.builder(
        itemCount: barcosList.length,
        itemBuilder: (context, index) {
          return Row(
            children: [
              Text(barcosList.first.toString()),
            ],
          );
        },
      ),
    );
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        _field('Precio del carro', priceController),
        _field('Precio de la Grua', gruaController),
        _field('Precio del barco', barcoController),
        Text('Precio ${_calculate().toString()}'),
        ElevatedButton(
          onPressed: () => setState(() {
            precio = double.parse(priceController.text);
            grua = double.parse(gruaController.text);
            barco = double.parse(barcoController.text);
          }),
          child: const Text('Cotizar'),
        )
      ],
    );
  }

  Widget _field(String title, TextEditingController _controller) {
    return Row(
      children: [
        Text(title, style: const TextStyle(fontSize: 30)),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: TextField(
            controller: _controller,
          ),
        ),
      ],
    );
  }

  Future<double> _calculate() async {
    final response = await rootBundle.loadString('assets/data/barco.json');
    // var barcoJson = barcoFromJson(response);
    // print(barcoJson);
    return grua + barco + precio;
  }
}
