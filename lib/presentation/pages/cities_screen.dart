import 'package:buycar/data/datasource/local_datasource.dart';
import 'package:buycar/domain/city.dart';
import 'package:flutter/material.dart';

class CitiesScreen extends StatefulWidget {
  const CitiesScreen({super.key});

  @override
  State<CitiesScreen> createState() => _CitiesScreenState();
}

class _CitiesScreenState extends State<CitiesScreen> {
  List<City> citiesList = [];

  Future<void> readData() async {
    citiesList = await getCities('california', 'Arizona');
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
