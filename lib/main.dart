import 'package:flutter/material.dart';
import 'package:flutter_states_provider/Providers/counter_provider.dart';
import 'package:flutter_states_provider/pages/home_page.dart';
import 'package:flutter_states_provider/Providers/user_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterProvider()),
        ChangeNotifierProvider(create: (_) => UserProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Contador con Provider',
      theme: ThemeData(primarySwatch: Colors.amber, useMaterial3: false),
      home: const HomePage(),
    );
  }
}