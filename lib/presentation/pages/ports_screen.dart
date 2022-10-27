import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/port.dart';
import 'package:flutter/material.dart';

class PortsScreen extends StatefulWidget {
  const PortsScreen({super.key});

  @override
  State<PortsScreen> createState() => _PortsScreenState();
}

class _PortsScreenState extends State<PortsScreen> {
  List<Port> portsList = [];

  Future<void> readData() async {
    portsList = await getPorts();
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
      appBar: AppBar(title: const Text('Puerto'),),
      body: ListView(
        children: portsList
            .map(
              (port) => ListTile(
                title: Text(port.puerto),
                onTap: () => Navigator.pop(context, port),
              ),
            )
            .toList(),
      ),
    );
  }
}
