import 'package:flutter/material.dart';

import '../../configuration/style.dart';

class Contact extends StatelessWidget {
  const Contact({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      decoration: const BoxDecoration(color: Colors.grey),
      child: const Center(child: Text("Grey")),
    );
  }
}
