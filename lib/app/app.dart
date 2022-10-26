import 'package:buycar/presentation/client/client_screen.dart';
import 'package:buycar/presentation/home/home_screen.dart';
import 'package:buycar/presentation/owner/owner_screen.dart';
import 'package:buycar/presentation/pages/ports_screen.dart';
import 'package:buycar/presentation/pages/ships_screen.dart';
import 'package:buycar/presentation/pages/states_screen.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
        colorScheme: ColorScheme.fromSwatch(
          accentColor: const Color(0xFF13B9FF),
        ),
      ),
      home: const HomeScreen(),
      routes: {
        '/owner': (context) => const OwnerScreen(),
        '/client': (context) => const ClientScreen(),
        '/ships': (context) => const ShipsScreen(),
        '/ports': (context) => const PortsScreen(),
        '/states': (context) => const StatesScreen(),
      },
    );
  }
}
