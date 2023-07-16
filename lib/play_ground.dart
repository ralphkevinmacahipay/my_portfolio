import 'package:flutter/material.dart';

class HoverImage extends StatefulWidget {
  final isHover;
  final String imageUrl;
  final double width;
  final double height;
  final Color hoverColor;

  const HoverImage({
    super.key,
    required this.imageUrl,
    required this.width,
    required this.height,
    required this.hoverColor,
    this.isHover,
  });

  @override
  _HoverImageState createState() => _HoverImageState();
}

class _HoverImageState extends State<HoverImage> {
  bool _isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) => setState(() => _isHovered = true),
      onExit: (_) => setState(() => _isHovered = false),
      child: ColorFiltered(
        colorFilter: _isHovered
            ? ColorFilter.mode(widget.hoverColor, BlendMode.srcATop)
            : const ColorFilter.mode(Colors.transparent, BlendMode.srcATop),
        child: SizedBox(
          width: widget.width,
          height: widget.height,
          child: Image.asset(
            widget.imageUrl,
            fit: BoxFit.fill,
          ),
        ),
      ),
    );
  }
}

// Usage:
