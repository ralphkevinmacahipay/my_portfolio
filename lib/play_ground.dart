import 'package:flutter/material.dart';
import 'package:my_profile/configuration/constant.dart';
import 'package:my_profile/configuration/style.dart';

class FloatingAvatar extends StatefulWidget {
  const FloatingAvatar({super.key});

  @override
  _FloatingAvatarState createState() => _FloatingAvatarState();
}

class _FloatingAvatarState extends State<FloatingAvatar>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0, end: 50).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: SizeConfig.blockY! * 10.94,
        right: SizeConfig.blockX! * 10.97,
      ),
      child: Align(
        alignment: Alignment.centerRight,
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Stack(
              children: [
                Positioned(
                  right: _animation.value,
                  child: Container(
                    width: SizeConfig.blockX! * 20.88,
                    height: SizeConfig.blockX! * 20.88,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          blurRadius: 10,
                          spreadRadius: 5,
                        ),
                      ],
                    ),
                    child: CircleAvatar(
                      backgroundColor: Colors.transparent,
                      radius: SizeConfig.blockX! * 20.88,
                      backgroundImage: AssetImage(kProfile),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
