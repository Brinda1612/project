import 'package:flutter/material.dart';
import 'package:project/cardItem.dart';
import 'package:project/filter.dart';
import 'package:project/model/dummyData.dart';

import 'model/data.dart';

class Search extends StatefulWidget {
  const Search({super.key});

  @override
  State<Search> createState() => _SearchState();
}

class _SearchState extends State<Search> {
  TextEditingController _searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(children: [
      Padding(
          padding: const EdgeInsets.fromLTRB(24, 60, 24, 0),
          child: Column(
            children: [
              TextField(
                controller: _searchController,
                onChanged: (query) {
                  print("Search Query: $query");
                },
                decoration: InputDecoration(
                  labelText: 'Search',
                  // hintText: 'Enter search term',
                  prefixIcon: Icon(Icons.search),
                  suffixIcon: _searchController.text.isNotEmpty
                      ? IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: () {
                            _searchController.clear();
                          },
                        )
                      : null,
                  filled: true, // Enable the background color
                  fillColor:
                      Colors.blue.withOpacity(0.1), // Light blue background
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24), // Border radius 24
                    borderSide: BorderSide(
                      color: Colors.blue.withOpacity(0.5), // Light blue border
                      width: 0.1,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(24), // Border radius 24
                    borderSide: BorderSide(
                      color: Colors.blue.withOpacity(0.0), // Light blue border
                      width: 1.5,
                    ),
                  ),
                  // contentPadding: EdgeInsets.symmetric(vertical: 16, horizontal: 12),
                ),
              ),
            ],
          )),
      SizedBox(
        height: 16,
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            OutlinedButton(
              onPressed: () {
                // Handle button press
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey), // Outline color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensure the row only takes up necessary space
                children: [
                  Icon(
                    Icons.sort, // Filter icon
                    color: Colors.blue, // Icon color
                  ),
                  SizedBox(width: 8), // Spacing between the icon and text
                  Text(
                    'Sort', // Button text
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 16, // Text size
                    ),
                  ),
                  SizedBox(width: 2), // Spacing between text and dropdown icon
                  Icon(
                    Icons.arrow_drop_down, // Dropdown icon
                    color: Colors.blue, // Icon color
                  ),
                ],
              ),
            ),
            SizedBox(width: 50,),
            OutlinedButton(
              onPressed: () {
                // Handle button press
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => FilterScreen()));
              },
              style: OutlinedButton.styleFrom(
                side: BorderSide(color: Colors.grey), // Outline color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12), // Rounded corners
                ),
              ),
              child: Row(
                mainAxisSize: MainAxisSize.min, // Ensure the row only takes up necessary space
                children: [
                  Icon(
                    Icons.filter_list, // Filter icon
                    color: Colors.blue, // Icon color
                  ),
                  SizedBox(width: 8), // Spacing between the icon and text
                  Text(
                    'Filter', // Button text
                    style: TextStyle(
                      color: Colors.blue, // Text color
                      fontSize: 16, // Text size
                    ),
                  ),
                ],
              ),
            ),


            // OutlinedButton(
            //   onPressed: null, // Set to null for dropdown-only behavior
            //   style: OutlinedButton.styleFrom(
            //     side: BorderSide(color: Colors.grey), // Outline color
            //     shape: RoundedRectangleBorder(
            //       borderRadius: BorderRadius.circular(12), // Rounded corners
            //     ),
            //   ),
            //   child: Row(
            //     mainAxisSize: MainAxisSize.min, // Adjust size to fit content
            //     children: [
            //       Icon(Icons.filter_alt, color: Colors.blue), // Filter icon
            //       SizedBox(width: 4), // Small spacing between icon and text
            //       Text('Sort', style: TextStyle(color: Colors.blue)), // Text
            //       SizedBox(width: 16), // Extra spacing between text and dropdown
            //       DropdownButton<String>(
            //         value: null, // Don't show any selected value
            //         onChanged: (value) {
            //           // Handle dropdown selection
            //         },
            //         items: [
            //           DropdownMenuItem(value: 'Asc', child: Text('Ascending')),
            //           DropdownMenuItem(value: 'Desc', child: Text('Descending')),
            //         ],
            //         underline: SizedBox(), // Remove default underline
            //         icon: Icon(Icons.arrow_drop_down,
            //             color: Colors.blue), // Only show the icon
            //         hint: SizedBox(), // No text or hint displayed
            //       ),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      SizedBox(
        height: 20,
      ),
          Column(
            children: [
              for(final item in dummy)
                CardItem(item: item,
                  // category: category,
                  // onSelectedCategory: () {
                  //   selectedCategory(context, category);
                  // },
                )
            ],
          )
        ]
        )
    );
  }
}
