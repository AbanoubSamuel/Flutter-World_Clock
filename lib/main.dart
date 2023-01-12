import 'package:flutter/material.dart';
import 'package:world_clock/pages/choose_location.dart';
import 'package:world_clock/pages/home.dart';
import 'package:world_clock/pages/loader.dart';

void main() {
  runApp(MaterialApp(
    initialRoute: '/',
    routes: {
      '/': (context) => const Loader(),
      '/home': (context) => const Home(),
      '/location': (context) => const ChooseLocation(),
    },
    debugShowCheckedModeBanner: false,
  ));
}
