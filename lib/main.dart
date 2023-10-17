import 'package:flutter/material.dart';
import 'package:flutter_custom_implicit_animations/default_tween_animation_builder_design.dart';
import 'package:flutter_custom_implicit_animations/flip_tween_animation_builder_design.dart';
import 'package:flutter_custom_implicit_animations/rotated_tween_animation_builder_design.dart';
import 'package:flutter_custom_implicit_animations/scale_tween_animation_builder_design.dart';
import 'package:flutter_custom_implicit_animations/spin_wheel/spin_wheel_design.dart';
import 'package:flutter_custom_implicit_animations/translate_tween_animation_builder_design.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SpinWheelDesign();
  }
}
