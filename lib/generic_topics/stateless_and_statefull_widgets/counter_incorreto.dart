import 'package:flutter/material.dart';

void main() => runApp(MaterialApp(
      home: Scaffold(body: Center(child: Counter())),
    ));

class Counter extends StatelessWidget {
  Counter({super.key});

  int counter = 0;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          counter++;
          debugPrint(counter.toString());
        },
        child: Text('$counter'));
  }
}
