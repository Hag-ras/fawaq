import 'package:flutter/material.dart';

class FawaqApp extends StatelessWidget {
  const FawaqApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Fawaq',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text(
            'Fawaq',
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
