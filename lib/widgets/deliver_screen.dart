import 'package:ShopSM/widgets/app_header.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DeliverScreen extends StatelessWidget {
  const DeliverScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 110,
            child: AppHeader(
              title: 'Deliver to',
              titleColor: Colors.black,
              titleFontWeight: FontWeight.w500,
              showBackButton: true,
              showShoppingCartButton: false,
              showLocationPicker: false,
              showSearchBar: false,
              onPressed: () {
                context.pop();
              },
            ),
          ),
        ],
      ),
    );
  }
}
