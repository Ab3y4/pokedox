import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:pokedox/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    timer();
  }

  void timer() {
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return const HomeScreen();
      }));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              Positioned(
                child: Center(
                  child: Lottie.asset('images/pokeball-loading.json',
                      height: 300, fit: BoxFit.fill, width: 300),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
