// ignore_for_file: cast_nullable_to_non_nullable
import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/city.dart';
import 'package:buycar/domain/state.dart';
import 'package:flutter/material.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {
  List<City> cities = [];

  Future<void> _getCities(String port, String state) async {
    setState(() {});
    cities = await getCities(port, state);
  }

  List<UsaState> statesList = [];
  @override
  Widget build(BuildContext context) {
    final response =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    statesList = response['States'] as List<UsaState>;
    final port = response['Port'] as String;
    final user = response['User'] as String;
    return Scaffold(
      appBar: AppBar(
        title: Text(port),
      ),
      body: ListView(
        children: statesList
            .map(
              (state) => ListTile(
                leading: const Icon(Icons.map),
                title: Text(state.estado),
                onTap: () {
                  setState(() {
                    _getCities(port.toLowerCase(), state.estado).then(
                      (value) => Navigator.pushNamed(
                        context,
                        '/cities',
                        arguments: {
                          'Cities': cities,
                          'State': state.estado,
                          'User': user,
                        },
                      ).then((value) => Navigator.pop(context,value)),
                    );
                  });
                  // Navigator.pushNamed(
                  //   context,
                  //   '/cities',
                  //   arguments: {
                  //     'Cities': cities,
                  //     'User': user,
                  //   },
                  // );
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
