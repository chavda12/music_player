import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:music_player/views/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Beats',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
       appBarTheme: AppBarTheme( backgroundColor: Colors.transparent,elevation: 0),
         ),
      home: HomeScreenUi(),
    );
  }
}
