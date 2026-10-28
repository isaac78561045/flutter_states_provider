import 'package:flutter/material.dart';
import 'package:flutter_states_provider/counter_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();

    return Scaffold(
      appBar: AppBar(title: const Text('Contador con provider')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Cuenta normal',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${counterProvider.counter}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 20),
            const Text(
              'Cuenta doble',
              style: TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 8),
            Text(
              '${counterProvider.doubleCounter}',
              style: const TextStyle(fontSize: 36, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 28),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 150,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().decrease();
                      context.read<CounterProvider>().decreaseDouble();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade400,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Decrementar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                SizedBox(
                  width: 150,
                  height: 42,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<CounterProvider>().increment();
                      context.read<CounterProvider>().incrementDouble();
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.amber.shade400,
                      foregroundColor: Colors.black,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    child: const Text(
                      'Incrementar',
                      style: TextStyle(fontSize: 16),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            SizedBox(
              width: 316,
              height: 42,
              child: ElevatedButton(
                onPressed: () => context.read<CounterProvider>().reset(),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.amber.shade400,
                  foregroundColor: Colors.black,
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                child: const Text(
                  'Resetear',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}