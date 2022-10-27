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
  List<City> cities = [];
  City city = City(ciudad: '', precio: 0);

  //Variables para calcular
  double precioBarco = 0;
  double precioGrua = 0;
  double precio = 0;
  double total = 0;

  Future<List<UsaState>> _getState(String port) {
    setState(() {});
    return getStates(port);
  }

  Future<List<City>> _getCities(String port, String state) {
    setState(() {});
    return getCities(port, state);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dueño'),
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
          onTap: () async {
            cities = await _getCities(port.puerto.toLowerCase(), state.estado);
            await Navigator.pushNamed(context, '/cities', arguments: cities)
                .then(
              (value) => setState(() {
                city = value! as City;
                precioGrua = double.parse(city.precio.toString());
              }),
            );
          },
          subTitle: city.ciudad,
        ),
        ElevatedButton(
          onPressed: () => setState(
            () => total = precioBarco + precioGrua,
          ),
          child: const Text('Cotizar'),
        ),
        Text('Precio $total'),
      ],
    );
  }
}
