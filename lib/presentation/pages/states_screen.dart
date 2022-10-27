// ignore_for_file: cast_nullable_to_non_nullable
import 'package:buycar/domain/state.dart';
import 'package:flutter/material.dart';

class StatesScreen extends StatefulWidget {
  const StatesScreen({super.key});

  @override
  State<StatesScreen> createState() => _StatesScreenState();
}

class _StatesScreenState extends State<StatesScreen> {
  List<UsaState> statesList = [];
  @override
  Widget build(BuildContext context) {
    statesList = ModalRoute.of(context)!.settings.arguments as List<UsaState>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estado'),
      ),
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
