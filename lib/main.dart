import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../screens/home_screen.dart';
import './screens/main_screen.dart';
import './subPagesOf6Box/subSubPages/salonLuxe.dart';
//import '../salonLuxe.dart'; // Import SalonLuxe file
//import 'YourCart.dart'; // Import YourCart file
import './widgets/yourCart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent),
    );
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.blue,
          brightness: Brightness.light,
        ),
        scaffoldBackgroundColor: Colors.white,
      ),
      initialRoute: '/', // Define the initial route
      routes: {
        '/': (context) => const MainScreen(), // MainScreen as the home screen
        '/salonLuxe': (context) => const SalonLuxe(title: 'Luxe'), // Route for SalonLuxe
        '/cart': (context) => const YourCart(), // Route for YourCart
      },
    );
  }
}