import 'package:flutter/material.dart';

class CustomAnimation extends StatefulWidget {
  static const routeName = 'Custom Animation';
  const CustomAnimation({super.key});

  @override
  State<CustomAnimation> createState() => _CustomAnimationState();
}

class _CustomAnimationState extends State<CustomAnimation> with SingleTickerProviderStateMixin {
  late final _animationController = AnimationController(
      vsync: this, duration: const Duration(milliseconds: 1000), lowerBound: 0.8, upperBound: 1.0);
  late final _customAnimation = Tween(
    begin: 0.0,
    end: 1.0,
  ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInCirc));

  @override
  void initState() {
    super.initState();
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
        title: const Text(CustomAnimation.routeName),
      ),
      body: Center(
        child: ScaleTransition(
          scale: _customAnimation,
          child: const SizedBox(
            width: 180,
            height: 180,
            child: FittedBox(
              fit: BoxFit.fill,
              child: Icon(Icons.favorite, color: Colors.pinkAccent),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }
}
