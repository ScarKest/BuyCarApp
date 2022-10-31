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
    final response =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    citiesList = response['Cities'] as List<City>;
    final user = response['User'];
    return Scaffold(
      appBar: AppBar(
        title: const Text('Ciudades'),
      ),
      body: ListView(
        children: citiesList
            .map(
              (city) => ListTile(
                leading: const Icon(Icons.place),
                title: Text(city.ciudad),
                trailing: (user == 'Owner')
                    ? Text('\$${city.precio}')
                    : Text('\$${city.precio + 50}'),
                onTap: () {
                  final cityClient = (user == 'Owner')
                      ? city
                      : City(
                          ciudad: city.ciudad,
                          precio: city.precio + 50,
                        );
                  Navigator.pop(context, cityClient);
                },
              ),
            )
            .toList(),
      ),
    );
  }
}
