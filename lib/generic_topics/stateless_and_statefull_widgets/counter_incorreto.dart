import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(
      home: Scaffold(body: Center(child: Counter())),
    ));

class Counter extends StatefulWidget {
  const Counter({super.key});

  @override
  State<Counter> createState() => _CounterState();
}

class _CounterState extends State<Counter> {
  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => setState(() {
              counter++;
              debugPrint(counter.toString());
            }),
        child: Text('$counter'));
  }
}
