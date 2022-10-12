import 'dart:convert';

import 'package:buycar/data/models/barco_model.dart';
import 'package:buycar/domain/barco.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  List<Barco> barcosList = [];
  //Controladores de texto
  TextEditingController priceController = TextEditingController();
  TextEditingController gruaController = TextEditingController();
  TextEditingController barcoController = TextEditingController();
  //Variables para calcular
  double precio = 0;
  double grua = 0;
  double barco = 0;
  Barco _items = Barco(california: [], florida: []);

  Future<void> readData() async {
    final response = await rootBundle.loadString('assets/data/barco.json');
    final ship = barcoModelFromJson(response);
    print('===== ${ship.florida.first.size}=====');
    // print('Listaaa ========== $_items==========');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Cliente'),
        ),
        // body: Container(),
        body: _body()
        // ListView.builder(
        //   itemCount: barcosList.length,
        //   itemBuilder: (context, index) {
        //     return Row(
        //       children: [
        //         Text(barcosList[index].tipo),
        //         const SizedBox(
        //           width: 40,
        //         ),
        //         Text(barcosList[index].precio),
        //       ],
        //     );
        //   },
        // ),
        );
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        _field('Precio del carro', priceController),
        _field('Precio de la Grua', gruaController),
        _field('Precio del barco', barcoController),
        const Text('Precio'),
        ElevatedButton(
          onPressed: () => readData(),
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
}
