import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Text Span Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: TextSpanExample(),
    );
  }
}

class TextSpanExample extends StatelessWidget {
  const TextSpanExample({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Text Span Example'),
      ),
      body: Center(
        child: RichText(
          text: const TextSpan(
            text: 'Developed by ',
            style: TextStyle(
              color: Colors.black,
              fontSize: 16.0,
            ),
            children: [
              TextSpan(
                text: 'Ralph Kevin Rynard E. Macahipay',
                style: TextStyle(
                  color: Colors.red,
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: ' © 2023',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.0,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
