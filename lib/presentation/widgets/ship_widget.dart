import 'package:buycar/domain/barco.dart';
import 'package:buycar/domain/city.dart';
import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class ShipWidget extends StatefulWidget {
  const ShipWidget({super.key, required this.user});

  final String user;

  @override
  State<ShipWidget> createState() => _ShipWidgetState();
}

class _ShipWidgetState extends State<ShipWidget> {
  //Variables para obtener los datos
  Ship ship = Ship(tipo: '', precio: 0);
  City city = City(ciudad: '', precio: 0);

  //Variables para calcular
  int? total = 0;

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(20),
      children: [
        ListTileCustom(
          title: 'Tipo de Carro',
          onTap: () => Navigator.pushNamed(context, '/ships').then(
            (value) => setState(() => ship = value! as Ship),
          ),
          subTitle: '${ship.tipo} \$${ship.precio}',
        ),
        ListTileCustom(
          title: 'Ciudad',
          onTap: () =>
              Navigator.pushNamed(context, '/ports', arguments: widget.user)
                  .then(
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
        const SizedBox(height: 40),
        Center(
          child: Text(
            'Total \$$total',
            style: const TextStyle(fontSize: 35),
          ),
        )
      ],
    );
  }
}
