import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/barco.dart';
import 'package:flutter/material.dart';

class BarcosScreen extends StatefulWidget {
  const BarcosScreen({super.key});

  @override
  State<BarcosScreen> createState() => _BarcosScreenState();
}

class _BarcosScreenState extends State<BarcosScreen> {
  List<Ship> barcosList = [];

  Future<void> readData() async {
    barcosList = await conectionFirebase();
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
                onTap: () => Navigator.pop(context, barco),
              ),
            )
            .toList(),
      ),
    );
  }
}
