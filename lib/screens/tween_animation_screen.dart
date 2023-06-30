import 'package:flutter/material.dart';

class TweenAnimationScreen extends StatefulWidget {
  static const routeName = 'Tween Animation';
  const TweenAnimationScreen({super.key});

  @override
  State<TweenAnimationScreen> createState() => _TweenAnimationScreenState();
}

class _TweenAnimationScreenState extends State<TweenAnimationScreen> {
  double _value = 0.0;
  late Color? _colorValue;
  Color firstColor = const Color(0xff00B2F8);
  Color secondColor = const Color(0xffff0000);

  @override
  void initState() {
    super.initState();
    _colorValue = const Color(0xff00B2F8);
  }

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
              child: Container(
                decoration: BoxDecoration(color: Colors.amber, border: Border.all(width: 1)),
                // decoration: BoxDecoration(color: _colorValue, border: Border.all(width: 1)),
                width: 120,
                height: 120,
              ),
              // child: Container(width: 120, height: 120, color: Colors.white),
              builder: (context, value, child) {
                return Transform.translate(
                  offset: Offset(value * 200 - 100, 0),
                  child: TweenAnimationBuilder<Color?>(
                    tween: ColorTween(begin: firstColor, end: _colorValue),
                    duration: const Duration(milliseconds: 500),
                    builder: (BuildContext _, Color? value, Widget? __) {
                      return ColorFiltered(
                        colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                        child: Container(width: 120, height: 120, color: Colors.white),
                      );
                    },
                  ),
                  // child: child,
                );
              },
            ),
            const SizedBox(height: 50),
            TweenAnimationBuilder<Color?>(
              tween: ColorTween(begin: firstColor, end: _colorValue),
              duration: const Duration(milliseconds: 500),
              builder: (BuildContext _, Color? value, Widget? __) {
                return ColorFiltered(
                  colorFilter: ColorFilter.mode(value!, BlendMode.modulate),
                  child: Container(width: 200, height: 200, color: Colors.white),
                );
              },
            ),
            Slider.adaptive(
              value: _value,
              onChanged: (value) => setState(() {
                _value = value;
                _colorValue = Color.lerp(firstColor, secondColor, _value);
              }),
            ),
          ],
        ));
  }
}
