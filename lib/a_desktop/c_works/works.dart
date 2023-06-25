import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

import '../../configuration/style.dart';

class Works extends StatelessWidget {
  const Works({
    super.key,
    required this.items,
  });

  final List<TyperAnimatedText> items;

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Container(
      height: SizeConfig.blockY! * 100,
      width: SizeConfig.blockX! * 100,
      decoration: const BoxDecoration(color: Colors.blue),
      child: AnimatedTextKit(
        animatedTexts: items,
        isRepeatingAnimation: true,
      ),
    );
  }
}
