import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 100,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(color: Colors.amber),
      child: const Text("Home"),
    );
  }
}
