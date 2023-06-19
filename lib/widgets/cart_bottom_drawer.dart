import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class CartBottomDrawer extends StatefulWidget {
  const CartBottomDrawer({Key? key}) : super(key: key);

  @override
  State<CartBottomDrawer> createState() => _CartBottomDrawerState();
}

class _CartBottomDrawerState extends State<CartBottomDrawer> {
  final String value = '500';

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      padding: const EdgeInsets.symmetric(horizontal: 18.0, vertical: 4.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            blurRadius: 5.0,
            offset: const Offset(0, -3),
          ),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Checkbox(
                    value: false,
                    onChanged: (value) {
                      // Handle checkbox onChanged event
                    },
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  const Text(
                    'All',
                    style: TextStyle(fontSize: 16.0, fontFamily: 'HenrySans'),
                  ),
                ],
              ),
              TextButton(
                onPressed: () {
                  // Handle "Remove Selected" button press
                },
                child: const Text(
                  'Remove Selected',
                  style: TextStyle(
                      fontSize: 14.0,
                      fontFamily: 'HenrySans',
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ],
          ),
          const Divider(
            height: 1,
            thickness: 1,
          ),
          const SizedBox(width: 500, height: 12),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Total',
                    style: TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'HenrySans',
                        fontWeight: FontWeight.w500),
                  ),
                  const SizedBox(width: 4.0),
                  Text(
                    '₱$value',
                    style: const TextStyle(
                        fontSize: 16.0,
                        fontFamily: 'HenrySans',
                        fontWeight: FontWeight.w500),
                  ),
                ],
              ),
              SizedBox(
                width: 240.0,
                height: 40.0,
                child: ElevatedButton(
                  onPressed: () {
                    context.push("/checkoutScreen");
                  },
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      const Color(0xFF0030FF),
                    ),
                    shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                    ),
                  ),
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 6.0),
                    child: Text(
                      'Checkout',
                      style: TextStyle(
                          fontSize: 14.0,
                          color: Colors.white,
                          fontFamily: 'HenrySans',
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
