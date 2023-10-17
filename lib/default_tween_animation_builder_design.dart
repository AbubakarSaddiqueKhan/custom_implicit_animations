import 'package:flutter/material.dart';

class DefaultTweenAnimationBuilderDesign extends StatefulWidget {
  const DefaultTweenAnimationBuilderDesign({super.key});

  @override
  State<DefaultTweenAnimationBuilderDesign> createState() =>
      _DefaultTweenAnimationBuilderDesignState();
}

class _DefaultTweenAnimationBuilderDesignState
    extends State<DefaultTweenAnimationBuilderDesign> {
  Tween<double> tween = Tween<double>(begin: 0, end: 0);
  void changeData() {
    setState(() {
      tween = Tween(begin: 0, end: 20);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Default Tween Animation Builder Design"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            TweenAnimationBuilder(
              tween: tween,
              duration: const Duration(seconds: 3),
              builder: (context, value, child) {
                return Transform(
                  transform: Matrix4.rotationX(value),
                  child: child,
                );
              },
              child: Container(
                width: 300,
                height: 300,
                color: Colors.red,
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(onPressed: changeData),
    );
  }
}
