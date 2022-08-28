import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cotiza tu carro'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 200),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _button(
              onPressed: () => Navigator.pushNamed(context, '/client'),
              title: 'Cliente',
              image: 'assets/images/client.png',
            ),
            const SizedBox(width: 100),
            _button(
              onPressed: () => Navigator.pushNamed(context, '/owner'),
              title: 'Dueño',
              image: 'assets/images/owner.png',
            )
          ],
          // 
        ),
      ),
    );
  }

  Widget _button({
    required VoidCallback onPressed,
    required String title,
    required String image,
  }) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.all(50),
        child: Column(
          children: [
            Image.asset(image, height: 50),
            Text(
              title,
              style: const TextStyle(fontSize: 40),
            ),
          ],
        ),
      ),
    );
  }
}
