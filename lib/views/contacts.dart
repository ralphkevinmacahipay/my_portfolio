import 'package:flutter/material.dart';
import 'package:velocity_x/velocity_x.dart';

class Contacts extends StatelessWidget {
  const Contacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: context.percentHeight * 100,
      width: context.percentWidth * 100,
      decoration: const BoxDecoration(color: Colors.red),
      child: const Text("Contacts"),
    );
  }
}
