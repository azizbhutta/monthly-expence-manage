import 'package:flutter/material.dart';

import 'NavBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffffefd5),
      drawer: const NavBar(),
      appBar: AppBar(
        backgroundColor: Colors.redAccent.withOpacity(0.8),
        title: const Text('monthly_expense_manage'),
      ),
      body: const Center(),
    );
  }
}
