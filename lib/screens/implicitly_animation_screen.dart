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
                    colors: const [Colors.purple, Colors.transparent],
                    stops: [_bigger ? 0.2 : 0.5, 1.0]),
              ),
              width: _bigger ? 100 : 400,
              duration: const Duration(milliseconds: 1000),
              curve: Curves.easeInOutQuint,
              child: Image.asset('assets/witch.png'),
            ),
            ElevatedButton(
              onPressed: () => setState(() => _bigger = !_bigger),
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
