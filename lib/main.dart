import 'dart:io' show Platform;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:desktop_window/desktop_window.dart';
// import 'package:desktop_window_utils/desktop_window_utils.dart';

import './models/item.dart';
import './screens/animationcontroller_screen.dart';
import './screens/custom_animation_screen.dart';
import './screens/tween_animation_screen.dart';
import './screens/implicitly_animation_screen.dart';
import './widgets/list_tile.dart';

void main() async {
  await setupWindow();
  runApp(const MyApp());
}

const double windowWidth = 480;
const double windowHeight = 854;

Future setupWindow() async {
  if (!kIsWeb && (Platform.isWindows || Platform.isLinux || Platform.isMacOS)) {
    WidgetsFlutterBinding.ensureInitialized();
    Size size = await DesktopWindow.getWindowSize();
    debugPrint('size: $size');
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
        CustomAnimation.routeName: (context) => const CustomAnimation(),
      },
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: Text(title),
        ),
        bottomNavigationBar: BottomAppBar(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          children: [
            IconButton(onPressed: () {}, icon: const Icon(Icons.home)),
            PopupMenuButton(
              icon: const Icon(Icons.share),
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: 1,
                  child: Text('Facebook'),
                ),
                const PopupMenuItem(
                  value: 2,
                  child: Text('Instagram'),
                ),
              ],
            ),
            IconButton(onPressed: () {}, icon: const Icon(Icons.email)),
          ],
        )),
        body: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0),
          child: CustomListTile([
            Item('Implicitly Animation', Icon(Icons.sunny)),
            Item('Tween Animation', Icon(Icons.cloud)),
            Item('AnimationController', Icon(Icons.bolt)),
            Item('Custom Animation', Icon(Icons.settings_suggest)),
          ]),
        ));
  }
}
