import 'package:ShopSM/widgets/app_header.dart';
import 'package:ShopSM/widgets/cart_bottom_drawer.dart';
import 'package:ShopSM/widgets/cart_item.dart';
import 'package:ShopSM/widgets/cart_tabs_content.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartScreen extends StatefulWidget {
  const CartScreen({Key? key}) : super(key: key);

  @override
  State<CartScreen> createState() => _CartScreenState();
}

class _CartScreenState extends State<CartScreen> with TickerProviderStateMixin {
  late TabController _parentTabController;
  Color parentLabelColor = const Color(0xFF0030FF);

  @override
  void initState() {
    super.initState();
    _parentTabController = TabController(length: 2, vsync: this);
    _parentTabController.addListener(_handleTabSelection);
  }

  @override
  void dispose() {
    _parentTabController.removeListener(_handleTabSelection);
    _parentTabController.dispose();
    super.dispose();
  }

  void _handleTabSelection() {
    setState(() {
      if (_parentTabController.index == 0) {
        parentLabelColor = const Color(0xFF0030FF);
      } else if (_parentTabController.index == 1) {
        parentLabelColor = const Color(0xFF157430);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(100),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: AppHeader(
                title: 'Cart',
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
            Container(
              height: 34,
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 237, 236, 236),
                border: Border.all(
                  color: const Color.fromARGB(255, 223, 223, 223),
                ),
                borderRadius: BorderRadius.circular(8.0),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 26.0),
              child: TabBar(
                controller: _parentTabController,
                indicator: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                ),
                tabs: [
                  Tab(
                    child: Text(
                      "SM Store",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'HenrySans',
                        color: _parentTabController.index == 0
                            ? parentLabelColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                  Tab(
                    child: Text(
                      "SM Markets",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        fontFamily: 'HenrySans',
                        color: _parentTabController.index == 1
                            ? parentLabelColor
                            : Colors.grey,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate(
              [
                SizedBox(
                  height: 295,
                  child: TabBarView(
                    controller: _parentTabController,
                    children: const [
                      StoreTabs(),
                      MarketsTabs(),
                    ],
                  ),
                ),
                const CartItem(),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: const CartBottomDrawer(),
    );
  }
}
