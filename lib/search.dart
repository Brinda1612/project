import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'cardItem.dart';
import 'model/data.dart';
import 'model/dummyData.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  final TextEditingController _searchController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    int columnCount = 2;
    // Number of columns
     // double width = MediaQuery.of(context).size.width;
    // double cardWidth = (width * 0.82);
    int crossAxisCount = 3;
    double screenWidth = MediaQuery.of(context).size.width;
    double cardWidth = (screenWidth * 0.82) / crossAxisCount;
    double cardHeight = cardWidth * (crossAxisCount == 2 ? 4 / 3 : 10 / 5);
    double childAspectRatio = cardWidth / cardHeight;

    // print('Screen width : $width');
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
            child: Column(
              children: [
                TextField(
                  controller: _searchController,
                  onChanged: (query) {
                    if (kDebugMode) {
                      print("Search Query: $query");
                    }
                  },
                  decoration: InputDecoration(
                    labelText: 'Search',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                      icon: const Icon(Icons.clear),
                      onPressed: () {
                        _searchController.clear();
                      },
                    )
                        : null,
                    filled: true,
                    fillColor: Colors.blue.withOpacity(0.1),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Colors.blue.withOpacity(0.5),
                        width: 0.1,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                      borderSide: BorderSide(
                        color: Colors.blue.withOpacity(0.0),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          Padding(
            padding: const EdgeInsets.fromLTRB(24,0,24,0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Sort Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.swap_vert, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        "Sort",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const Icon(Icons.keyboard_arrow_down, color: Colors.grey, size: 16),
                    ],
                  ),
                ),

                // Filter Button
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade400),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.filter_list, color: Colors.grey, size: 16),
                      const SizedBox(width: 4),
                      const Text(
                        "Filter",
                        style: TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                      const SizedBox(width: 8),
                      Container(
                        padding: const EdgeInsets.all(4),
                        decoration: const BoxDecoration(
                          color: Colors.blue,
                          shape: BoxShape.circle,
                        ),
                        child: const Text(
                          "2",
                          style: TextStyle(fontSize: 10, color: Colors.white),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 30),



    Expanded(
    child: SingleChildScrollView(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24.0), // Left and Right Padding
      child: LayoutBuilder(
      builder: (context, constraints) {
      double totalSpacing = (columnCount - 1) * 15; // Total horizontal space between cards
      double availableWidth = constraints.maxWidth - totalSpacing; // Adjust for spacing
      double cardWidth = availableWidth / columnCount; // Calculate card width
      
      return Wrap(
      spacing: 15, // Horizontal space between cards
      runSpacing: 20, // Vertical space between rows
      children: dummy.map((item) {
      return Container(
      width: cardWidth,
      child: CardItem(item: item), // Pass the current Item object
      );
      }).toList(),
      );
      },
      ),
      ),
    ),
    ),



    ],
      ),
    );
  }
}
