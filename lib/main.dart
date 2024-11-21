import 'package:flutter/material.dart';
import 'package:mi_pimera_app/My_Home_Page.dart';
import 'package:mi_pimera_app/providers/My_app_state.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: "My primera app",
        theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
          ),
          home: MyHomePage(),
      ),
    );
  }
}