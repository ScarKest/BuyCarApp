import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/barco.dart';
import 'package:flutter/material.dart';

class ShipsScreen extends StatefulWidget {
  const ShipsScreen({super.key});

  @override
  State<ShipsScreen> createState() => _ShipsScreenState();
}

class _ShipsScreenState extends State<ShipsScreen> {
  List<Ship> barcosList = [];

  Future<void> readData() async {
    barcosList = await getShips();
    setState(() {});
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barco'),
      ),
      body: ListView(
        children: barcosList
            .map(
              (barco) => ListTile(
                leading: const Icon(Icons.directions_boat_outlined),
                title: Text(barco.tipo),
                trailing: (user == 'Owner')
                    ? Text('\$${barco.precio}')
                    : Text('\$${barco.precio + 50 }'),
                onTap: () => Navigator.pop(context, barco),
              ),
            )
            .toList(),
      ),
    );
  }
}
