import 'package:ShopSM/mock/cart_item_data.dart';
import 'package:flutter/material.dart';

class CartItemData {
  final String title;
  final String productImage;
  final String productName;
  final String brandName;
  final List<String> colorOptions;

  CartItemData({
    required this.title,
    required this.productImage,
    required this.productName,
    required this.brandName,
    required this.colorOptions,
  });
}

class CartItem extends StatefulWidget {
  const CartItem({Key? key}) : super(key: key);

  @override
  State<CartItem> createState() => _CartItemState();
}

class _CartItemState extends State<CartItem> {
  String selectedColor = '';
  final productData = cartItemData;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: productData.map<Widget>((productInfo) {
        // final storeName = productData['storeName'] as String;

        return Column(children: [
          // Title
          Container(
            alignment: Alignment.topLeft,
            child: const Text(
              // storeName,
              "",
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ]);
      }).toList(),
      //   children: widget.productData.map((itemData) {
      //     return Column(
      //       children: [
      //         // Title
      //         Container(
      //           alignment: Alignment.topLeft,
      //           child: Text(
      //             itemData['storeName'],
      //             style: const TextStyle(
      //               fontSize: 16,
      //               fontWeight: FontWeight.bold,
      //             ),
      //           ),
      //         ),
      //         const SizedBox(height: 8),

      //         // Cart Item
      //         Row(
      //           children: [
      //             // Checkbox
      //             const Checkbox(value: false, onChanged: null),

      //             // Product Image
      //             Image.network(
      //               itemData['productImage'],
      //               width: 60,
      //               height: 60,
      //             ),

      //             const SizedBox(width: 8),

      //             // Product Name and Brand Name
      //             Column(
      //               crossAxisAlignment: CrossAxisAlignment.start,
      //               children: [
      //                 Text(
      //                   itemData['productName'],
      //                   style: const TextStyle(fontSize: 14),
      //                 ),
      //                 Text(
      //                   itemData['brand'],
      //                   style: const TextStyle(fontSize: 12),
      //                 ),
      //               ],
      //             ),

      //             const Spacer(),

      //             // X Button
      //             IconButton(
      //               icon: const Icon(Icons.close),
      //               onPressed: () {
      //                 // TODO: Implement delete functionality
      //               },
      //             ),
      //           ],
      //         ),

      //         const SizedBox(height: 8),

      //         // Color Dropdown
      //         Row(
      //           children: [
      //             const Text('Color:'),
      //             const SizedBox(width: 8),
      //             DropdownButton<String>(
      //               value: selectedColor,
      //               items: (itemData['colorOptions'] != null &&
      //                       (itemData['colorOptions'] as List<String>).isNotEmpty)
      //                   ? (itemData['colorOptions'] as List<String>).map((color) {
      //                       return DropdownMenuItem<String>(
      //                         value: color,
      //                         child: Text(color),
      //                       );
      //                     }).toList()
      //                   : [
      //                       const DropdownMenuItem<String>(
      //                         value: '',
      //                         child: Text('No Color Options'),
      //                       ),
      //                     ],
      //               onChanged: (newValue) {
      //                 setState(() {
      //                   selectedColor = newValue!;
      //                 });
      //               },
      //             ),
      //           ],
      //         ),

      //         // Horizontal Line Divider
      //         Divider(
      //           thickness: 1,
      //           color: Colors.grey[300],
      //         ),

      //         const SizedBox(height: 16),
      //       ],
      //     );
      //   }).toList(),
    );
  }
}
