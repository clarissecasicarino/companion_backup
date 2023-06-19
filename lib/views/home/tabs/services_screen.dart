import 'package:ShopSM/widgets/quick_action_static.dart';
import 'package:flutter/material.dart';

class ServicesScreen extends StatelessWidget {
  const ServicesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 16.0),
      alignment: Alignment.topCenter,
      child: const QuickActionStatic(),
    );
  }
}
