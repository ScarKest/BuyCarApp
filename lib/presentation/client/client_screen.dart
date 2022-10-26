import 'package:buycar/domain/barco.dart';
import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class ClientScreen extends StatefulWidget {
  const ClientScreen({super.key});

  @override
  State<ClientScreen> createState() => _ClientScreenState();
}

class _ClientScreenState extends State<ClientScreen> {
  //Variables para obtener los datos
  Barco ship = Barco(tipo: '', precio: '');

  //Variables para calcular
  double precioBarco = 0;
  double grua = 0;
  double precio = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cliente'),
      ),
      body: _body(),
    );
  }

  Widget _body() {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        ListTileCustom(
          title: 'Tipo de Carro',
          onTap: () => Navigator.pushNamed(context, '/ships').then(
            (value) => setState(
              () => ship = value! as Barco,
            ),
          ),
          subTitle: ship.tipo,
        ),
        ListTileCustom(
          title: 'Estado',
          onTap: () => Navigator.pushNamed(context, '/states'),
          subTitle: 'si',
        ),
        const Text('Precio'),
        ElevatedButton(
          onPressed: () => print('Cotizando...'),
          child: const Text('Cotizar'),
        )
      ],
    );
  }
}
