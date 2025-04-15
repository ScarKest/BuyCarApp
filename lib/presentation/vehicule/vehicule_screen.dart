import 'package:buycar/presentation/vehicule/bloc/vehicule_bloc.dart';
import 'package:buycar/presentation/vehicule/vehicule_form.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class VehiculeScreen extends StatelessWidget {
  const VehiculeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Vehículos')),
      body: BlocProvider(
        create: (_) => VehiculeBloc(),
        child: VehiculeForm(),
      ),
    );
  }
}
