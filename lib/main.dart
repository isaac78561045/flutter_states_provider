import 'package:flutter/material.dart';
import 'package:flutter_states_provider/Providers/counter_provider.dart';
import 'package:flutter_states_provider/Providers/theme_provider.dart';
import 'package:flutter_states_provider/Providers/user_provider.dart';
import 'package:flutter_states_provider/pages/home_page.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = context.watch<ThemeProvider>();

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador con Provider',
      theme: ThemeData(
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.white,
        useMaterial3: false,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.amber,
        scaffoldBackgroundColor: Colors.black,
        useMaterial3: false,
      ),
      themeMode: themeProvider.themeMode,
      home: const HomePage(),
    );
  }
}