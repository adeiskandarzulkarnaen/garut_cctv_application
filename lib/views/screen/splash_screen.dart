import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Future.delayed(const Duration(seconds: 3), () {
      GoRouter.of(context).goNamed("home", /* extra: */);
    });
    super.initState();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amber,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Icon(
              Icons.panorama_fish_eye_outlined,
              size: 60,
            ),
            const SizedBox(height: 20),
            AnimatedTextKit(
              repeatForever: false, 
              animatedTexts: [
                TyperAnimatedText(
                  '- garut cctv app -',
                  textStyle: Theme.of(context).textTheme.headlineSmall,
                  speed: const Duration(milliseconds: 90)
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}