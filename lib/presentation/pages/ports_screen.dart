// ignore_for_file: cast_nullable_to_non_nullable
import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/port.dart';
import 'package:buycar/domain/state.dart';
import 'package:flutter/material.dart';

class PortsScreen extends StatefulWidget {
  const PortsScreen({super.key});

  @override
  State<PortsScreen> createState() => _PortsScreenState();
}

class _PortsScreenState extends State<PortsScreen> {
  List<Port> portsList = [];
  List<UsaState> states = <UsaState>[];
  String user = '';

  Future<void> readData() async {
    portsList = await getPorts();
    setState(() {});
  }

  Future<void> _getState(String port) async {
    setState(() {});
    states = await getStates(port);
  }

  @override
  void initState() {
    readData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    user = ModalRoute.of(context)!.settings.arguments as String;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puerto'),
      ),
      body: ListView(
        children: portsList
            .map(
              (port) => ListTile(
                leading: const Icon(Icons.anchor_rounded),
                title: Text(port.puerto),
                onTap: () {
                  setState(() {
                    _getState(port.puerto.toLowerCase()).then(
                      (value) => Navigator.pushNamed(
                        context,
                        '/states',
                        arguments: {
                          'States': states,
                          'Port': port.puerto,
                          'User': user,
                        },
                      ).then((value) => Navigator.pop(context, value)),
                    );
                  });
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
