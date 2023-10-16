import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/presentation/providers/counter_provider.dart';
import 'package:widgets_app/presentation/providers/theme_provider.dart';

class CounterScreen extends ConsumerWidget {
  static const name = 'counter_screen';
  const CounterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int counterProv = ref.watch(counterProvider);
    final bool isDarkMode = ref.watch(themeProvider);
    // int counter = 0;
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          ref.read(counterProvider.notifier).state++;
          // ref.read(counterProvider.notifier).update((state) => state + 1);
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).update((state) => !state);
            },
            icon: Icon(
              isDarkMode ? Icons.dark_mode_outlined : Icons.light_mode_outlined,
            ),
          )
        ],
        title: Text(
          'Counter Screen',
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: Center(
        child: Text('Valor: $counterProv'),
      ),
    );
  }
}
