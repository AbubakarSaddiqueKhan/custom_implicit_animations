import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_custom_implicit_animations/spin_wheel/spin_wheel_painter.dart';

class SpinWheelDesign extends StatefulWidget {
  const SpinWheelDesign({super.key});

  @override
  State<SpinWheelDesign> createState() => _SpinWheelDesignState();
}

Tween<double> rotatedTweenValue = Tween<double>(begin: 0, end: 0);
double lastRotatedValue = 0;

Random random = Random();

class _SpinWheelDesignState extends State<SpinWheelDesign> {
  void rotateSpinWheel() {
    setState(() {
      rotatedTweenValue = Tween(
          begin: lastRotatedValue,
          end: lastRotatedValue =
              lastRotatedValue + random.nextDouble() * 4 * pi);
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.sizeOf(context);
    var screenWidth = screenSize.width;
    var screenHeight = screenSize.height;
    var clientHeight = screenHeight - kToolbarHeight;
    return Scaffold(
      appBar: AppBar(
        title: Text("Spin Wheel Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 10,
              height: 50,
              color: Colors.amber,
            ),
            TweenAnimationBuilder(
              tween: rotatedTweenValue,
              builder: (context, value, child) {
                return Transform.rotate(
                  angle: value,
                  child: child,
                );
              },
              duration: const Duration(seconds: 3),
              child: Container(
                width: screenWidth * 0.7,
                height: clientHeight * 0.8,
                decoration: BoxDecoration(shape: BoxShape.circle),
                child: CustomPaint(
                  painter: SpinWheelDesignPainter(
                      totalNumberOfOptions: 6,
                      listOfPrices: [
                        "Car",
                        "Helipcopter",
                        "No Reward",
                        "Moter Cycle",
                        "Cycle",
                        "No Reward",
                        "Laptop",
                        " Iphone",
                        "Car",
                        "Helipcopter",
                        "No Reward",
                        "Moter Cycle",
                        "Cycle",
                        "No Reward",
                        "Laptop",
                        " Iphone"
                      ]),
                ),
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: rotateSpinWheel),
    );
  }
}
