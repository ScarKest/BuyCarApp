// ignore_for_file: use_build_context_synchronously
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
  List<UsaState> states = [];
  City city = City(ciudad: '', precio: 0);

  //Variables para calcular
  double precioBarco = 0;
  double precioGrua = 0;
  double precio = 0;

  Future<List<UsaState>> _getState(String port) {
    setState(() {});
    return getStates(port);
  }

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
            (value) => setState(() {
              ship = value! as Ship;
              precioBarco = double.parse(ship.precio);
            }),
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
          onTap: () async {
            states = await _getState(port.puerto.toLowerCase());
            await Navigator.pushNamed(context, '/states', arguments: states)
                .then(
              (value) => setState(() {
                state = value! as UsaState;
              }),
            );
          },
          subTitle: state.estado,
        ),
        ListTileCustom(
          title: 'Ciudad',
          onTap: () =>
              Navigator.pushNamed(context, '/cities', arguments: state).then(
            (value) => setState(
              () => city = value! as City,
            ),
          ),
          subTitle: city.ciudad,
        ),
        const Text('Precio'),
        ElevatedButton(
          onPressed: () {
            setState(() {});
          },
          child: const Text('Cotizar'),
        )
      ],
    );
  }
}
