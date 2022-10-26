import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/barco.dart';
import 'package:flutter/material.dart';

class BarcosScreen extends StatefulWidget {
  const BarcosScreen({super.key});

  @override
  State<BarcosScreen> createState() => _BarcosScreenState();
}

class _BarcosScreenState extends State<BarcosScreen> {
  List<Barco> barcosList = [];

  Future<void> readData() async {
    barcosList = await conectionFirebase();
    setState(() {
      
    });
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: barcosList
            .map(
              (barco) => ListTile(
                title: Text(barco.tipo),
                onTap: () => Navigator.pop(context, barco),
              ),
            )
            .toList(),
      ),
    );
  }
}
