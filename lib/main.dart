import 'package:flutter/material.dart';
import 'package:flutter_apps_dashboard/app_constants.dart';
import 'package:flutter_apps_dashboard/screens/home/home_screen.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Amarnath Alavandar Portfolio',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.grey),
        useMaterial3: true,
      ),
      home: const HomeScreen(pageTitle:AppConstants.pageTitle,),
    );
  }
}