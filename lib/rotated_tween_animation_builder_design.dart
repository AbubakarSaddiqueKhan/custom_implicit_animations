import 'dart:math';

import 'package:flutter/material.dart';

class RotatedTweenAnimationBuilderDesign extends StatefulWidget {
  const RotatedTweenAnimationBuilderDesign({super.key});

  @override
  State<RotatedTweenAnimationBuilderDesign> createState() =>
      _RotatedTweenAnimationBuilderDesignState();
}

// tween is used to give the starting and the ending value
Tween<double> myTweenValue = Tween<double>(begin: 0, end: 0);

class _RotatedTweenAnimationBuilderDesignState
    extends State<RotatedTweenAnimationBuilderDesign> {
  void rotateContainer() {
    setState(() {
      myTweenValue = Tween<double>(begin: 0, end: 2 * pi);

      print(myTweenValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Tween Animation Builder Design"),
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
                // The child that the builder gives is taken from the child given below it in the tween animation builder
                // The value will be fetched from the tween
                return Transform.rotate(
                  angle: value,
                  child: child,
                );
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.deepOrange,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateContainer),
    );
  }
}
