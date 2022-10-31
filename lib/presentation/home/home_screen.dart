import 'package:flutter/material.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

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
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          _button(
            onPressed: () => Navigator.pushNamed(context, '/client', arguments: 'Client'),
            title: 'Cliente',
            image: 'assets/images/client.png',
          ),
          const SizedBox(height: 30),
          _button(
            onPressed: dialogPassword,
            title: 'Dueño',
            image: 'assets/images/owner.png',
          )
        ],
      ),
    );
  }

  void dialogPassword() {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Ingrese Contraseña'),
        content: PinCodeTextField(
          obscureText: true,
          appContext: context,
          length: 4,
          onChanged: (_) {},
          onCompleted: (value) => (value != '1234')
              ? passwordError()
              : Navigator.pushNamed(context, '/owner', arguments: 'Owner'),
        ),
      ),
    );
  }

  void passwordError() {
    showDialog<String>(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        title: const Text('Contraseña Incorrecta'),
        content: const Icon(
          Icons.warning_rounded,
          color: Colors.red,
          size: 80,
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
        padding: const EdgeInsets.all(20),
        child: Center(
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
      ),
    );
  }
}
