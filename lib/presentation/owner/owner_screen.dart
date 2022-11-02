// ignore_for_file: use_build_context_synchronously
import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/barco.dart';
import 'package:buycar/domain/city.dart';
import 'package:buycar/domain/port.dart';
import 'package:buycar/domain/state.dart';
import 'package:buycar/presentation/widgets/invoice_widget.dart';
import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  //Variables para obtener los datos
  Ship ship = Ship(tipo: '', precio: 0);
  Port port = Port(puerto: '');
  UsaState state = UsaState(estado: '');
  List<UsaState> states = [];
  List<City> cities = [];
  City city = City(ciudad: '', precio: 0);

  //Variables para calcular
  int? total = 0;

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
    final user = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dueño'),
      ),
      body: _body(user.toString()),
      bottomSheet: _customBottomSheet(),
    );
  }

  Widget _body(String user) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        InvoiceWidget(user: user),
        ListTileCustom(
          title: 'Tipo de Carro',
          onTap: () => Navigator.pushNamed(context, '/ships').then(
            (value) => setState(() => ship = value! as Ship),
          ),
          subTitle: ship.tipo,
        ),
        ListTileCustom(
          title: 'Puerto',
          onTap: () => Navigator.pushNamed(context, '/ports').then(
            (value) => setState(() => port = value! as Port),
          ),
          subTitle: port.puerto,
        ),
        ListTileCustom(
          title: 'Estado',
          onTap: () async {
            if (port.puerto.isNotEmpty) {
              states = await _getState(port.puerto.toLowerCase());
              await Navigator.pushNamed(context, '/states', arguments: states)
                  .then(
                (value) => setState(() => state = value! as UsaState),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Seleccione un puerto primero')),
              );
            }
          },
          subTitle: state.estado,
        ),
        ListTileCustom(
          title: 'Ciudad',
          onTap: () async {
            if (state.estado.isNotEmpty) {
              cities =
                  await _getCities(port.puerto.toLowerCase(), state.estado);
              await Navigator.pushNamed(
                context,
                '/cities',
                arguments: {
                  'Cities': cities,
                  'User': user,
                },
              ).then(
                (value) => setState(() => city = value! as City),
              );
            } else {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('Seleccione un estado primero'),
                ),
              );
            }
          },
          subTitle: city.ciudad,
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

  List<Widget> invoiceCopart() {
    return [
      const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.car_crash),
          label: Text('Precio de Vehiculo'),
          // hintText: 'Solo',
        ),
      ),
      const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.eco_outlined),
          label: Text('Enviroment Fee'),
          hintText: r'$10',
        ),
        readOnly: true,
      ),
      const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.money),
          label: Text('Virtual Fee'),
          hintText: r'$10',
        ),
        readOnly: true,
      ),
      const TextField(
        decoration: InputDecoration(
          icon: Icon(Icons.car_crash),
          label: Text('Buyer Fee'),
          hintText: r'$10',
        ),
        readOnly: true,
      ),
    ];
  }
}
