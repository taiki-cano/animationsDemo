import 'package:animations_demo/screens/animationcontroller_screen.dart';
import 'package:animations_demo/screens/tween_animation_screen.dart';
import 'package:flutter/material.dart';

import './models/item.dart';
import './screens/implicitly_animation_screen.dart';
import './widgets/list_tile.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(centerTitle: true),
      ),
      routes: {
        '/': (ctx) => const MyHomePage(title: 'Animation Demo'),
        ImplicitlyAnimationScreen.routeName: (ctx) => const ImplicitlyAnimationScreen(),
        TweenAnimationScreen.routeName: (context) => const TweenAnimationScreen(),
        AnimationControllerScreen.routeName: (context) => const AnimationControllerScreen(),
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(widget.title),
        ),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomListTile([
            Item('Implicitly Animation', Icon(Icons.sunny)),
            Item('Tween Animation', Icon(Icons.cloud)),
            Item('AnimationController', Icon(Icons.bolt)),
          ]),
        ));
  }
}
