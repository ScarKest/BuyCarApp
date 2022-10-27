import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/state.dart';
import 'package:flutter/material.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {
  List<UsaState> statesList = [];

  Future<void> readData() async {
    statesList = await getStates('California','Arizona');
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
      appBar: AppBar(title: const Text('Estado'),),
      body: ListView(
        children: statesList
            .map(
              (state) => ListTile(
                title: Text(state.estado),
                onTap: () => Navigator.pop(context, state),
              ),
            )
            .toList(),
      ),
    );
  }
}
