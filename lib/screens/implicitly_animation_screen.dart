import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ImplicitlyAnimationScreen extends StatefulWidget {
  static const routeName = 'Implicitly Animation';
  const ImplicitlyAnimationScreen({super.key});
  @override
  State<ImplicitlyAnimationScreen> createState() => _ImplicitlyAnimationScreenState();
}

class _ImplicitlyAnimationScreenState extends State<ImplicitlyAnimationScreen> {
  final random = Random();
  double _width = 200;
  Color _color = Colors.red;
  bool _bigger = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(ImplicitlyAnimationScreen.routeName),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              decoration: BoxDecoration(
                gradient: RadialGradient(
                    colors: [_color, Colors.transparent],
                    // colors: const [Colors.purple, Colors.transparent],
                    stops: [_bigger ? 0.2 : 0.5, 1.0]),
              ),
              width: _width,
              duration: const Duration(milliseconds: 500),
              curve: Curves.easeInOutCubic,
              child: Image.asset('assets/witch.png'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _bigger = !_bigger;
                  _width = (random.nextInt(300) + 150).toDouble();
                  _color = Color.fromRGBO(
                      random.nextInt(128), random.nextInt(128), random.nextInt(128), 1);
                });
              },
              child: const Icon(CupertinoIcons.star_fill),
            ),
          ],
        ),
      ),
    );
  }
}

class SineCurve extends Curve {
  final double count;
  const SineCurve({this.count = 1});

  @override
  double transformInternal(double t) {
    return sin(count * 2 * pi * t) * 0.5 + 0.5;
  }
}
