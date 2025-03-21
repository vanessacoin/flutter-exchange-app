import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Image.asset('assets/home_img.png', fit: BoxFit.cover),
        Center(
          child: Padding(
            padding: const EdgeInsets.only(left: 20.0),
          ),
        ),
      ],
    );
  }
}
