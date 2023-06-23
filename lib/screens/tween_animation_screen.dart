import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget {
  static const routeName = 'Tween Animation';
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(TweenAnimationScreen.routeName),
      ),
      body: Center(),
    );
  }
}
