import 'package:ShopSM/widgets/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:heroicons/heroicons.dart';

class ProductSearchBar extends StatelessWidget {
  const ProductSearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 4.0),
      child: Column(
        children: <Widget>[
          const SizedBox(
            height: 10.0,
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.grey[200], // Set the inside color to gray
              borderRadius: BorderRadius.circular(10.0), // Set border radius
            ),
            child: Row(
              children: <Widget>[
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 10.0),
                  child: HeroIcon(
                    HeroIcons.magnifyingGlass,
                    color: Color.fromARGB(255, 120, 120, 121),
                    size: 20,
                  ),
                ),
                Expanded(
                  child: TypeAheadField(
                    textFieldConfiguration: TextFieldConfiguration(
                      autofocus: false,
                      style: DefaultTextStyle.of(context).style.copyWith(
                          fontStyle: FontStyle.normal, fontFamily: 'HenrySans'),
                      decoration: const InputDecoration(
                          hintText: 'Search for any product, across all stores',
                          border: InputBorder.none),
                    ),
                    suggestionsCallback: (pattern) async {
                      return await BackendService.getSuggestions(pattern);
                    },
                    itemBuilder: (context, Map<String, String> suggestion) {
                      return ListTile(
                        title: Text(suggestion['name']!),
                      );
                    },
                    onSuggestionSelected: (Map<String, String> suggestion) {
                      Navigator.of(context).push<void>(
                        MaterialPageRoute(
                          builder: (context) =>
                              ProductScreen(product: suggestion),
                        ),
                      );
                    },
                    suggestionsBoxDecoration: SuggestionsBoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      elevation: 8.0,
                      color: Theme.of(context).cardColor,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: GestureDetector(
                    onTap: () {
                      // UNCOMMENT THIS CODE WHEN READY TO USE
                      // Navigator.of(context).push(MaterialPageRoute(
                      //   builder: (context) => const QRScanner(),
                      // ));
                    },
                    child: const HeroIcon(
                      HeroIcons.qrCode,
                      color: Color.fromARGB(255, 120, 120, 121),
                      size: 20,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class BackendService {
  static Future<List<Map<String, String>>> getSuggestions(String query) async {
    await Future<void>.delayed(const Duration(seconds: 1));

    List<String> productNames = [
      'Parisian',
      'Adidas',
      'Nike',
      'Crocs',
      'Dyson',
      'Cetaphil',
      'Maybelline',
      'Ace Hardware',
      'Luxe Organix',
      'Olay',
    ];

    List<Map<String, String>> suggestions = productNames
        .where((productName) =>
            productName.toLowerCase().contains(query.toLowerCase()))
        .map((productName) => {'name': productName})
        .toList();

    return suggestions;
  }
}
