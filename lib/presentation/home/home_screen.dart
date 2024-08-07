import 'dart:ui';

import 'package:flutter/material.dart';

class HomeScreen1 extends StatefulWidget {
  const HomeScreen1({super.key});

  @override
  State<HomeScreen1> createState() => _HomeScreen1State();
}

class _HomeScreen1State extends State<HomeScreen1> {
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
          _optionCard(
            image: 'assets/images/vehicule.jpg',
            title: 'Vehiculo',
            onPressed: () => Navigator.pushNamed(context, '/vehicule'),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.1,
          ),
          _optionCard(
            image: 'assets/images/package.jpg',
            title: 'Paquetes',
            onPressed: () => Navigator.pushNamed(context, '/package'),
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
                // Clip it cleanly.
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                  child: Container(
                    color: Colors.grey.withOpacity(0.1),
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
        ));
  }
}
