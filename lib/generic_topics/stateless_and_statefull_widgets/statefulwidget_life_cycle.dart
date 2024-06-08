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
    return Column(
      children: [
        StatefullWidgetText(counter: counter),
        ElevatedButton(
            onPressed: () => setState(() {
                  counter++;
                }),
            child: Text('$counter')),
        SizedBox(
          height: 80,
          child: ElevatedButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text('Fechar página')),
        ),
      ],
    );
  }
}

class StatefullWidgetText extends StatefulWidget {
  const StatefullWidgetText({
    super.key,
    required this.counter,
  });

  final int counter;

  @override
  State<StatefullWidgetText> createState() => _StatefullWidgetTextState();
}

class _StatefullWidgetTextState extends State<StatefullWidgetText> {
  // variáveis internas para controle da contagem de chamadas dos métodos do
  // ciclo de vida do widget
  int _initStateCounter = 0;
  int _didUpdateWidgetCounter = 0;
  int _disposeCounter = 0;

  // Ciclo de vida
  // 1. initState (executado uma vez ao iniciar o widget)
  @override
  void initState() {
    super.initState();
    debugPrint('Chamando initState (${++_initStateCounter})');
  }

  // 2. didUpdateWidget (executado sempre que este widget se reconstrói por
  // meio de uma chamada do pai. A interface de usuario é reconstruída
  // automaticamente, não havendo necessidade de chamar setState nesse método)
  @override
  void didUpdateWidget(covariant StatefullWidgetText oldWidget) {
    debugPrint('Chamando didUpdateWidget (${++_didUpdateWidgetCounter})');
    super.didUpdateWidget(oldWidget);
  }

  // 3. dispose (executado somente uma vez ao final, quando o widget é
  // permanentemente finalizado e retirado da árvore de widgets)
  @override
  void dispose() {
    debugPrint('Chamando dispose (${++_disposeCounter})');
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Text('Counter: ${widget.counter}');
  }
}
