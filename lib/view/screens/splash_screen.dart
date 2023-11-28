import 'package:flutter/material.dart';
import 'dart:async';

import 'package:quiz_app/view/screens/question_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(duration: Duration(seconds: 2), vsync: this);
    _animation =
        Tween<double>(begin: 0.0, end: 1.0).animate(_animationController);

    _animationController.forward();

    // Simulating a delay using a Timer to show the splash screen for a few seconds
    Timer(Duration(seconds: 3), () {
      // Navigate to the main quiz screen after the delay
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => QuestionScreen()),
      );
    });
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink[100], // Change to your preferred background color
      body: Center(
        child: FadeTransition(
          opacity: _animation,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              ScaleTransition(
                scale: _animation,
                child: Icon(
                  Icons.quiz,
                  color: Colors.purple[900],
                  size: 150,
                ),
              ),
              SizedBox(height: 20),
              // Text or any other widget to display while loading
              ScaleTransition(
                scale: _animation,
                child: Text(
                  'Welcome to Quiz App',
                  style: TextStyle(
                    fontSize: 30,
                    fontStyle: FontStyle.italic,
                    fontWeight: FontWeight.w600,
                    color: Colors.purple[900],
                  ),
                ),
              ),
              // You can add additional content here
            ],
          ),
        ),
      ),
    );
  }
}
