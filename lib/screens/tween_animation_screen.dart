import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget {
  static const routeName = 'Tween Animation';
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  double _value = 0.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text(TweenAnimationScreen.routeName),
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TweenAnimationBuilder<double>(
              duration: const Duration(milliseconds: 500),
              tween: Tween(begin: 0.0, end: _value),
              child: Container(width: 120, height: 120, color: Colors.red),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 200 - 100, 0),
                  child: child,
                );
              },
            ),
            Slider.adaptive(
              value: _value,
              onChanged: (value) => setState(() {
                _value = value;
              }),
            ),
          ],
        ));
  }
}
