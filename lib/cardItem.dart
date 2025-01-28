import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:project/model/data.dart';

class CardItem extends StatelessWidget {
  const CardItem({super.key, required this.item});
final Item item;
  @override
  Widget build(BuildContext context) {
    return  Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween, // Space between cards
        children: [
          // First Card
          Container(
            height: 189,
            width: 144,

            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16), // Card radius
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 8,
                  offset: Offset(0, 4), // Shadow position
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
              children: [
                // Image Section
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(16), // Top corners rounded
                    topRight: Radius.circular(16),
                  ),
                  child: Image.asset(
                    'assets/image1.jpg', // Replace with your image
                    fit: BoxFit.cover,
                    width: double.infinity, // Image covers full width
                    height: 120, // Adjust height as needed
                  ),
                ),
                SizedBox(height: 8), // Spacing between image and text
                // Text Section
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start, // Align text to start
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 12,
                        ),
                      ),
                      // Text(
                      //   item.amount.toString(),
                      //   style: TextStyle(
                      //     fontSize: 14,
                      //     fontWeight: FontWeight.bold,
                      //     color: Colors.black,
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          // Second Card

        ],
      ),
    );
  }
}
