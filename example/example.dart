import 'package:fan_floating_menu/fan_floating_menu.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FanFloatingMenu',
      theme: ThemeData(
        primarySwatch: Colors.pink,
      ),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(50),
      child: FanFloatingMenu(
        menuItems: [
          FanMenuItem(onTap: () {}, icon: Icons.edit_rounded, title: 'Edit Texts'),
          FanMenuItem(onTap: () {}, icon: Icons.save_rounded, title: 'Save Notes'),
          FanMenuItem(onTap: () {}, icon: Icons.send_rounded, title: 'Send Images'),
        ],
      ),
    ));
  }
}
