// import 'dart:math';

import 'package:flutter/material.dart';

class AnimationControllerScreen extends StatefulWidget {
  static const routeName = 'AnimationController';
  const AnimationControllerScreen({super.key});

  @override
  State<AnimationControllerScreen> createState() => _AnimationControllerScreenState();
}

class _AnimationControllerScreenState extends State<AnimationControllerScreen>
    with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
    vsync: this,
    duration: const Duration(milliseconds: 1000),
    lowerBound: 0.5,
    upperBound: 1.0,
  );

  @override
  void initState() {
    super.initState();
    // _animationController.repeat();
    _animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _animationController.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _animationController.forward();
      }
    });
    _animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(AnimationControllerScreen.routeName),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _animationController,
          child: const SizedBox(
            // decoration: const BoxDecoration(shape: BoxShape.circle, color: Colors.green),
            // color: Colors.amber,
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(Icons.favorite, color: Colors.red),
            ),
          ),
        ),
        // child: RotationTransition(
        //   turns: _animationController,
        //   child: Container(width: 180, height: 180, color: Colors.blue),
        // ),
        // child: AnimatedBuilder(
        //   animation: _animationController,
        //   child: Container(width: 180, height: 180, color: Colors.red),
        //   builder: (context, child) {
        //     return Transform.rotate(
        //       angle: 0.5 * pi * _animationController.value,
        //       child: child,
        //     );
        //   },
        // ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
