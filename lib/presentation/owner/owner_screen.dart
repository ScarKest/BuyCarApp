// ignore_for_file: cast_nullable_to_non_nullable

import 'package:buycar/presentation/widgets/list_tile_custom.dart';
import 'package:flutter/material.dart';

class OwnerScreen extends StatefulWidget {
  const OwnerScreen({super.key});

  @override
  State<OwnerScreen> createState() => _OwnerScreenState();
}

class _OwnerScreenState extends State<OwnerScreen> {
  //Variables para calcular
  final _total = 0;
  int invoicePrice = 0;
  int shipPrice = 0;
  int guatemalaPrice = 0;

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Dueño'),
        ),
        body: ListView(
          children: [
            ListTileCustom(
              title: 'Valores del Carro',
              subTitle: 'Total $_total ',
              onTap: () =>
                  Navigator.pushNamed(context, '/invoice', arguments: user),
            ),
            ListTileCustom(
              title: 'Naviera',
              subTitle: 'Total \$$shipPrice ',
              onTap: () =>
                  Navigator.pushNamed(context, '/ship', arguments: user).then(
                (value) =>
                    setState(() => shipPrice = value as int),
              ),
            ),
            ListTileCustom(
              title: 'Valores en Guatemala',
              subTitle: 'Total $_total ',
              onTap: () {},
            ),
          ],
        ),
        bottomSheet: _customBottomSheet(),
      ),
    );
  }

  Widget _customBottomSheet() {
    return Container(
      alignment: Alignment.center,
      width: double.infinity,
      height: 150,
      color: Colors.lightBlue,
      child: Text(
        'Precio \$$_total',
        style: const TextStyle(
          fontSize: 35,
          color: Colors.white,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
