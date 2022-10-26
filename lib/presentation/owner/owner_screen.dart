import 'package:buycar/domain/barco.dart';
import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
 //Variables para obtener los datos
  Ship ship = Ship(tipo: '', precio: '');
  //Port port = Port()
  //State state = state()

  //Variables para calcular
  double precioBarco = 0;
  double precioGrua = 0;
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
              () => ship = value! as Ship,
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
