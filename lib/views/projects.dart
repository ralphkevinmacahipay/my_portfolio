import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Projects extends StatelessWidget {
  const Projects({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 92,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(color: Colors.deepPurple),
      child: const Text("Project"),
    );
  }
}
