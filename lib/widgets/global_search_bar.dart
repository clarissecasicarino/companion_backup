import 'package:flutter/material.dart';

class GlobalSearchBar extends StatelessWidget {
  GlobalSearchBar({Key? key}) : super(key: key);

  final TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        // height: 5,
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        decoration: BoxDecoration(
          color: Colors.grey[200], // Set the inside color to gray
          borderRadius: BorderRadius.circular(10.0), // Set border radius
        ),
        child: TextField(
          enableSuggestions: true,
          controller: _searchController,
          decoration: InputDecoration(
            hintText: 'Search for any product across SM Store',
            // Add a clear button to the search bar
            // suffixIcon: IconButton(
            //   icon: Icon(Icons.clear),
            //   onPressed: () => _searchController.clear(),
            // ),
            // Add a search icon or button to the search bar
            prefixIcon: IconButton(
              icon: const Icon(Icons.search),
              onPressed: () {
                //.... PERFORM SEARCH HERE
              },
            ),
            // border: OutlineInputBorder(
            //   borderRadius: BorderRadius.circular(20.0),
            // ),
            // contentPadding: const EdgeInsets.symmetric(vertical: 100.0),
          ),
        ),
      ),
    );
  }
}