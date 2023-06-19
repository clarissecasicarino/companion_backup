import 'package:ShopSM/mock/delivery_address.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:heroicons/heroicons.dart';

class StoreTabs extends StatefulWidget {
  const StoreTabs({Key? key}) : super(key: key);

  @override
  State<StoreTabs> createState() => _StoreTabsState();
}

class _StoreTabsState extends State<StoreTabs> with TickerProviderStateMixin {
  late TabController _storeChildTabController;

  @override
  void initState() {
    super.initState();
    _storeChildTabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _storeChildTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: Text(
              'Select Delivery Options',
              style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 14.0,
                  fontFamily: 'HenrySans'),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              SizedBox(
                width: 214,
                height: 48,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 6.0),
                  child: TabBar(
                    controller: _storeChildTabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    splashBorderRadius: BorderRadius.circular(24.0),
                    tabs: const [
                      Tab(
                        child: Text(
                          'Delivery',
                          style: TextStyle(fontFamily: 'HenrySans'),
                        ),
                      ),
                      Tab(
                        child: Text(
                          'Pickup',
                          style: TextStyle(fontFamily: 'HenrySans'),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 180,
          child: TabBarView(
            controller: _storeChildTabController,
            children: [
              AddressDetails(data: deliveryData, isDelivery: true),
              AddressDetails(data: pickupLocationsData, isDelivery: false),
            ],
          ),
        ),
      ],
    );
  }
}

class AddressDetails extends StatelessWidget {
  final bool isDelivery;
  final List<dynamic>? data;

  const AddressDetails({Key? key, required this.data, required this.isDelivery})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<dynamic> validData = data ?? [];

    return Stack(
      children: List.generate(validData.length, (index) {
        final shippingData = validData[index];
        final String? name = shippingData['name'];
        final String? number = shippingData['number'];
        final dynamic address = shippingData['address'];
        final String storeName = shippingData['storeName'] ?? '';

        return GestureDetector(
          onTap: () {
            context.push('/deliverScreen');
          },
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                if (isDelivery)
                  const Text(
                    'My Home',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'HenrySans',
                      fontSize: 14.0,
                    ),
                  ),
                if (isDelivery) const SizedBox(height: 10.0),
                Row(
                  children: [
                    Text(
                      name ?? storeName,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: 'HenrySans',
                        fontWeight:
                            !isDelivery ? FontWeight.w500 : FontWeight.normal,
                      ),
                    ),
                    const SizedBox(width: 8.0),
                    if (number != null)
                      Text(
                        number,
                        style: const TextStyle(
                            color: Colors.grey, fontFamily: 'HenrySans'),
                      ),
                  ],
                ),
                const SizedBox(height: 6.0),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        "${address["addressLine1"]} ${address["barangay"]} ${address["city"]} ${address["province"]} ${address["zip"]}",
                        maxLines: 2,
                        style: const TextStyle(
                          color: Colors.black,
                          overflow: TextOverflow.ellipsis,
                          fontFamily: 'HenrySans',
                        ),
                        softWrap: true,
                      ),
                    ),
                    const SizedBox(width: 20),
                    const HeroIcon(
                      HeroIcons.chevronRight,
                      size: 16,
                      style: HeroIconStyle.solid,
                      color: Color.fromARGB(255, 126, 126, 126),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}

class MarketsTabs extends StatefulWidget {
  const MarketsTabs({Key? key}) : super(key: key);

  @override
  State<MarketsTabs> createState() => _MarketsTabsState();
}

class _MarketsTabsState extends State<MarketsTabs>
    with TickerProviderStateMixin {
  late TabController _marketsChildTabController;

  @override
  void initState() {
    super.initState();
    _marketsChildTabController = TabController(length: 1, vsync: this);
  }

  @override
  void dispose() {
    _marketsChildTabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 20.0),
        const Align(
          alignment: Alignment.topLeft,
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 30.0, vertical: 4.0),
            child: Text(
              'Select Delivery Options',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14.0,
                fontFamily: 'HenrySans',
              ),
            ),
          ),
        ),
        const SizedBox(height: 4.0),
        Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              SizedBox(
                width: 140,
                height: 46,
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 24.0, vertical: 6.0),
                  child: TabBar(
                    controller: _marketsChildTabController,
                    labelColor: Colors.black,
                    unselectedLabelColor: Colors.grey,
                    indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24.0),
                        side: const BorderSide(color: Colors.black),
                      ),
                    ),
                    tabs: const [
                      Tab(
                        child: Text(
                          'Delivery',
                          style: TextStyle(
                            fontFamily: 'HenrySans',
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 200,
          child: TabBarView(
            controller: _marketsChildTabController,
            children: [
              AddressDetails(data: deliveryData, isDelivery: true),
            ],
          ),
        ),
      ],
    );
  }
}
