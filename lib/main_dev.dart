
import 'package:buycar/app/app.dart';
import 'package:buycar/bootstrap.dart';
import 'package:buycar/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  bootstrap(() => const App());
}
