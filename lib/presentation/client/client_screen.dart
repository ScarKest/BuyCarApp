// ignore_for_file: use_build_context_synchronously
import 'package:buycar/domain/barco.dart';
import 'package:buycar/domain/city.dart';
import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  //Variables para obtener los datos
  Ship ship = Ship(tipo: '', precio: 0);
  City city = City(ciudad: '', precio: 0);

  //Variables para calcular
  int? total = 0;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: _body(user.toString()),
      bottomSheet: _customBottomSheet(),
    );
  }

  Widget _body(String user) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ListTileCustom(
          title: 'Carro',
          onTap: () => Navigator.pushNamed(context, '/invoice').then(
            (value) => setState(() => ship = value! as Ship),
          ),
          subTitle: ship.tipo,
        ),
        ListTileCustom(
          title: 'Ciudad',
          onTap: () => Navigator.pushNamed(context, '/ports').then(
            (value) => setState(() => city = value! as City),
          ),
          subTitle: '${city.ciudad} \$${city.precio}',
        ),
        ElevatedButton(
          onPressed: () => setState(
            () => total = ship.precio + city.precio,
          ),
          child: const Text('Cotizar'),
        ),
      ],
    );
  }

  Widget _customBottomSheet() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      color: Colors.lightBlue,
      child: Text(
        'Precio \$$total',
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
