import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

import 'package:ShopSM/widgets/location_picker.dart';
import 'package:ShopSM/widgets/product_search_bar.dart';

class AppHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final bool showShoppingCartButton;
  final bool showLocationPicker;
  final bool showSearchBar;
  final VoidCallback? onPressed;
  final Color titleColor;
  final FontWeight titleFontWeight;

  const AppHeader({
    Key? key,
    required this.title,
    this.showBackButton = true,
    this.showShoppingCartButton = true,
    this.showLocationPicker = true,
    this.showSearchBar = true,
    this.onPressed,
    this.titleColor = const Color(0xFF0030FF),
    this.titleFontWeight = FontWeight.w900,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 60),
      child: Column(
        children: [
          SizedBox(
            height: 48.0,
            child: Stack(
              children: <Widget>[
                if (showBackButton) _buildBackButton(onPressed),
                Container(
                  height: 40,
                  alignment: Alignment.center,
                  child: Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 26,
                      fontWeight: titleFontWeight,
                      color: titleColor,
                      fontFamily: 'HenrySans',
                    ),
                  ),
                ),
                if (showShoppingCartButton) _buildShoppingCartButton(context),
              ],
            ),
          ),
          if (showLocationPicker) const LocationPicker(),
          if (showSearchBar) const ProductSearchBar(),
        ],
      ),
    );
  }

  Widget _buildBackButton(VoidCallback? onPressed) {
    return Positioned(
      left: 24,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            width: 45,
            height: 45,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: Color(0xFFF1F1F3),
            ),
            padding: const EdgeInsets.all(2.0),
          ),
          IconButton(
            iconSize: 20,
            icon: const HeroIcon(
              HeroIcons.arrowLeft,
              color: Color.fromARGB(255, 120, 120, 121),
            ),
            onPressed: onPressed,
          ),
        ],
      ),
    );
  }

  Widget _buildShoppingCartButton(BuildContext context) {
    return Expanded(
      child: Positioned(
        left: 360,
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            Container(
              width: 45,
              height: 45,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xFFF1F1F3),
              ),
              child: IconButton(
                iconSize: 20,
                icon: const HeroIcon(
                  HeroIcons.shoppingCart,
                  color: Color.fromARGB(255, 120, 120, 121),
                ),
                onPressed: () {
                  context.push('/cart');
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
