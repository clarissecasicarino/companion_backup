import 'package:flutter/material.dart';

class StoreScreen extends StatelessWidget {
  final String id;

  const StoreScreen({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Store Screen'),
      ),
      body: Center(
        child: Text(id),
      ),
    );
  }
}
