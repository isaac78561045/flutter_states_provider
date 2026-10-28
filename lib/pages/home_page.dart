import 'package:flutter/material.dart';
import 'package:flutter_states_provider/Providers/counter_provider.dart';
import 'package:flutter_states_provider/Providers/theme_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final counterProvider = context.watch<CounterProvider>();
    final themeProvider = context.watch<ThemeProvider>();
    final isDarkMode = themeProvider.themeMode == ThemeMode.dark;

    void showTitleDialog() {
      final controller = TextEditingController(text: themeProvider.title);

      showDialog(
        context: context,
        builder: (dialogContext) {
          return AlertDialog(
            title: const Text('Cambiar título'),
            content: TextField(
              controller: controller,
              decoration: const InputDecoration(
                hintText: 'Escribe el nuevo título',
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(dialogContext),
                child: const Text('Cancelar'),
              ),
              TextButton(
                onPressed: () {
                  context.read<ThemeProvider>().changeTitle(controller.text);
                  Navigator.pop(dialogContext);
                },
                child: const Text('Guardar'),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      backgroundColor: isDarkMode ? Colors.black : Colors.white,
      appBar: AppBar(
        title: Text(
          themeProvider.title,
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.amber,
        foregroundColor: Colors.black,
        centerTitle: false,
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Cuenta normal',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${counterProvider.counter}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                'Cuenta doble',
                style: TextStyle(
                  fontSize: 18,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '${counterProvider.doubleCounter}',
                style: TextStyle(
                  fontSize: 36,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? Colors.white : Colors.black,
                ),
              ),
              const SizedBox(height: 28),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: showTitleDialog,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cambiar título',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => context.read<ThemeProvider>().changeTheme(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    isDarkMode ? 'Tema claro' : 'Tema oscuro',
                    style: const TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().decrease();
                    context.read<CounterProvider>().decreaseDouble();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Decrementar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: () {
                    context.read<CounterProvider>().increment();
                    context.read<CounterProvider>().incrementDouble();
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Incrementar',
                    style: TextStyle(fontSize: 16),
                  ),
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                width: 300,
                height: 52,
                child: ElevatedButton(
                  onPressed: () => context.read<CounterProvider>().reset(),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.amber.shade400,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
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
      ),
    );
  }
}
