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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Barco'),
      ),
      body: ListView(
        children: barcosList
            .map(
              (barco) => ListTile(
                leading: const Icon(Icons.anchor_rounded),
                title: Text(barco.tipo),
                trailing: Text(barco.precio),
                onTap: () => Navigator.pop(context, barco),
              ),
            )
            .toList(),
      ),
    );
  }
}
