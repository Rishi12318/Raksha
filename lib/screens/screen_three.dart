import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:go_router/go_router.dart';
import 'dart:async';

class ScreenThree extends StatefulWidget {
  const ScreenThree({super.key});

  @override
  State<ScreenThree> createState() => _ScreenThreeState();
}

class _ScreenThreeState extends State<ScreenThree> {
  String _connectionText = 'Connecting';
  int _dotCount = 0;
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startConnectingAnimation();
    
    // Auto navigate to home after 5 seconds
    Future.delayed(const Duration(seconds: 5), () {
      if (mounted) {
        context.go('/home');
      }
    });
  }

  void _startConnectingAnimation() {
    _timer = Timer.periodic(const Duration(milliseconds: 500), (timer) {
      if (mounted) {
        setState(() {
          _dotCount = (_dotCount + 1) % 4;
          _connectionText = 'Connecting${'.' * _dotCount}';
        });
      }
    });
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFE8D5FF),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Looping Flower Animation
            SizedBox(
              width: 300,
              height: 300,
              child: Lottie.asset(
                'animations/looping_flower.json',
                fit: BoxFit.contain,
                repeat: true,
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Connecting Text
            Text(
              _connectionText,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: Color(0xFFCB94F7),
                letterSpacing: 1.5,
              ),
            ),
            
            const SizedBox(height: 16),
            
            // Subtitle
            Text(
              'Setting up your safety profile',
              style: TextStyle(
                fontSize: 16,
                color: Colors.black.withOpacity(0.6),
              ),
            ),
            
            const SizedBox(height: 40),
            
            // Progress Indicator
            SizedBox(
              width: 200,
              child: LinearProgressIndicator(
                backgroundColor: Colors.white.withOpacity(0.3),
                valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFFCB94F7)),
                minHeight: 6,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
