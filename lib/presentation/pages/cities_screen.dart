// ignore_for_file: cast_nullable_to_non_nullable
import 'package:buycar/domain/city.dart';
import 'package:flutter/material.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<City> citiesList = [];
  @override
  Widget build(BuildContext context) {
    citiesList = ModalRoute.of(context)!.settings.arguments as List<City>;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciudades'),
      ),
      body: ListView(
        children: citiesList
            .map(
              (city) => ListTile(
                title: Text(city.ciudad),
                trailing: Text(city.precio.toString()),
                onTap: () => Navigator.pop(context, city),
              ),
            )
            .toList(),
      ),
    );
  }
}
