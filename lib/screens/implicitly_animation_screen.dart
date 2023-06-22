import 'package:flutter/material.dart';

class ImplicitlyAnimationScreen extends StatelessWidget {
  static const routeName = 'Implicitly Animation';
  const ImplicitlyAnimationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(routeName),
      ),
      body: const Center(),
      // child: ElevatedButton(
      //   onPressed: () => Navigator.pop(context),
      //   child: const Text('Go back!'),
      // ),
      // ),
    );
  }
}
