import 'package:flutter/material.dart';
import 'package:onboardingscreen/onboard.dart';

void main() {
  runApp(const OnBoard());
}

class OnBoard extends StatelessWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: OnBoarding(),
    );
  }
}
