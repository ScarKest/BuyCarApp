import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/barco.dart';
import 'package:buycar/domain/city.dart';
import 'package:buycar/domain/port.dart';
import 'package:buycar/domain/state.dart';
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
  Port port = Port(puerto: '');
  UsaState state = UsaState(estado: '');
  City city = City(ciudad: '', precio: 0);

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
          title: 'Puerto',
          onTap: () => Navigator.pushNamed(context, '/ports').then(
            (value) => setState(
              () => port = value! as Port,
            ),
          ),
          subTitle: port.puerto,
        ),
        ListTileCustom(
          title: 'Estado',
          onTap: () => Navigator.pushNamed(context, '/states').then(
            (value) => setState(
              () => state = value! as UsaState,
            ),
          ),
          subTitle: state.estado,
        ),
        ListTileCustom(
          title: 'Ciudad',
          onTap: () => Navigator.pushNamed(context, '/cities').then(
            (value) => setState(
              () => city = value! as City,
            ),
          ),
          subTitle: city.ciudad,
        ),
        const Text('Precio'),
        ElevatedButton(
          onPressed: () {
            print('Cotizando...');
            // getShips();
            getPorts();
            // getStates();
          },
          child: const Text('Cotizar'),
        )
      ],
    );
  }
}
