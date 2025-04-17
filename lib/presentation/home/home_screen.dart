import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotiza tu carro'),
        centerTitle: true,
      ),
      body: ListView(
        padding: EdgeInsets.all(20),
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          _optionCard(
            image: 'assets/images/vehicule.jpg',
            title: 'Vehiculo',
            onPressed: () => Navigator.pushNamed(context, '/vehicule'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          _optionCard(
            image: 'assets/images/vehicule_gold.jpg',
            title: 'Precio de Factura',
            onPressed: () =>
                Navigator.pushNamed(context, '/invoiceCopart'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          _optionCard(
            image: 'assets/images/vehicule_gold.jpg',
            title: 'Hitorial de cotizaciones',
            onPressed: () =>
                Navigator.pushNamed(context, '/history_transactions'),
          ),
        ],
      ),
    );
  }

  Widget _optionCard({
    String title = '',
    String image = '',
    VoidCallback? onPressed,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: SizedBox(
        height: 200,
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.asset(image, fit: BoxFit.cover),
            ClipRRect(
              child: BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                child: Container(
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
