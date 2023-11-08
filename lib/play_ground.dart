import 'package:flutter/material.dart';

class TextApp extends StatelessWidget {
  const TextApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.builder(
        itemCount: 10, // Replace with the actual number of items
        itemBuilder: (BuildContext context, int index) {
          return HoverContainer(index: index);
        },
      ),
    );
  }
}

class HoverContainer extends StatefulWidget {
  final int index;

  const HoverContainer({super.key, required this.index});

  @override
  _HoverContainerState createState() => _HoverContainerState();
}

class _HoverContainerState extends State<HoverContainer> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      onEnter: (_) {
        setState(() {
          isHovered = true;
        });
      },
      onExit: (_) {
        setState(() {
          isHovered = false;
        });
      },
      child: Container(
        margin: const EdgeInsets.all(8.0),
        padding: const EdgeInsets.all(16.0),
        color: isHovered ? Colors.blue[100] : Colors.white,
        child: Text('Item ${widget.index + 1}'),
      ),
    );
  }
}
