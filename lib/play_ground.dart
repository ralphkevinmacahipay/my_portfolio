import 'package:flutter/material.dart';

class TestApp extends StatelessWidget {
  const TestApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(backgroundColor: AppBarTheme.of(context).backgroundColor),
    );
  }
}
