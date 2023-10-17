import 'dart:math';

import 'package:flutter/material.dart';

class FlipTweenAnimationBuilderDesign extends StatefulWidget {
  const FlipTweenAnimationBuilderDesign({super.key});

  @override
  State<FlipTweenAnimationBuilderDesign> createState() =>
      _FlipTweenAnimationBuilderDesignState();
}

// tween is used to give the starting and the ending value
Tween<Offset> myTweenValue =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0));
double angle = 0;

class _FlipTweenAnimationBuilderDesignState
    extends State<FlipTweenAnimationBuilderDesign> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Flip Tween Animation Builder Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              tween: myTweenValue,
              duration: const Duration(seconds: 10),
              builder: (context, value, child) {
                return Transform.flip(
                  flipX: true,
                  flipY: true,

                  // flip will mirror it's child widget

                  child: const Text(
                    'vertical  flipped ',
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 35,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
            )
          ],
        ),
      ),
    );
  }
}
