import 'package:flutter/material.dart';
import '../../configuration/style.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      decoration: const BoxDecoration(color: Colors.orange),
      child: const Center(child: Text("Orage")),
    );
  }
}
