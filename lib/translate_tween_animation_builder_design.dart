import 'dart:math';

import 'package:flutter/material.dart';

class TranslateTweenAnimationBuilderDesign extends StatefulWidget {
  const TranslateTweenAnimationBuilderDesign({super.key});

  @override
  State<TranslateTweenAnimationBuilderDesign> createState() =>
      _TranslateTweenAnimationBuilderDesignState();
}

// tween is used to give the starting and the ending value
Tween<Offset> myTweenValue =
    Tween<Offset>(begin: Offset(0, 0), end: Offset(0, 0));

class _TranslateTweenAnimationBuilderDesignState
    extends State<TranslateTweenAnimationBuilderDesign> {
  void translateContainer() {
    setState(() {
      myTweenValue = Tween<Offset>(begin: Offset(0, 0), end: Offset(100, 100));

      print(myTweenValue);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Scale Tween Animation Builder Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
                tween: myTweenValue,
                duration: const Duration(seconds: 5),
                builder: (context, value, child) {
                  // translate is used to move the given child from the one offset to another offset
                  return Transform.translate(
                    offset: value,
                    child: Container(
                      padding: const EdgeInsets.all(8.0),
                      color: const Color(0xFF7F7F7F),
                      child: const Text('Quarter'),
                    ),
                  );
                },
                child: Text("Trqanslated")),
            // )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: translateContainer),
    );
  }
}
