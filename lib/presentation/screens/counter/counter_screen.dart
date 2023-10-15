import 'package:flutter/material.dart';

class CounterScreen extends StatelessWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int counter = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: Text(
          'Counter Screen',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Text('Valor: $counter'),
      ),
    );
  }
}
