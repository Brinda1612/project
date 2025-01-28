import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/search.dart';

class Interest extends StatefulWidget {
  const Interest({super.key});

  @override
  State<Interest> createState() => _InterestState();
}

class _InterestState extends State<Interest> {
  List<bool> isSelectedbutton = List.generate(8, (_) => false);
  List<String> buttonNames = [
    'User Interface',
    'User Experience',
    'User Research',
    'UX Writing',
    'User Testing',
    'Service Design',
    'Strategy',
    'Design Systems'
  ];

  bool isSelected = false; // State to track if the button is selected

  Widget customOutlinedButton({
    required BuildContext context,
    required bool isSelected,
    required Function() onPressed,
    required String buttonText,
  }) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
      child: OutlinedButton(
        style: OutlinedButton.styleFrom(
          minimumSize:
              Size(double.infinity, 50), // Full width (cover width) and height
          backgroundColor: isSelected
              ? Colors.blue.withOpacity(0.1)
              : Colors.transparent, // Light blue background when selected
          side: BorderSide(
            color: isSelected
                ? Colors.transparent
                : Colors.grey.shade300, // Hide border when selected
            width: 1.5,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // Set border radius to 12
          ),
        ),
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start, // Align text to start
          children: [
            Text(
              buttonText,
              style: TextStyle(
                color: Colors.black, // Text color stays black (doesn't change when selected)
                fontSize: 14, // Set text size to 14
              ),
            ),
            Spacer(), // Pushes the check icon to the end of the button
            if (isSelected)
              Icon(Icons.check,
                  color: Colors.blue, size: 16), // Right tick icon at the end
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 64, 24, 0),
            child: Container(
              height: 8, // Set the height of the progress bar
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(4), // Rounded corners
                color: Colors.grey[300], // Background color
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(
                    4), // Ensure the progress bar respects the radius
                child: LinearProgressIndicator(
                  value: 0.5, // Set progress value between 0.0 and 1.0
                  valueColor: AlwaysStoppedAnimation<Color>(
                      Colors.blue), // Progress color
                  backgroundColor: Colors
                      .transparent, // Transparent background inside the container
                ),
              ),
            ),
          ),
          SizedBox(
            height: 26,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Personalise your \n'
                    'experience',
                    textAlign: TextAlign.start, // Centers the text
                    style: GoogleFonts.inter(
                      fontSize: 24,
                      fontWeight: FontWeight.w900,
                      // color: Colors.black.withOpacity(0.5), // 50% opacity
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Text(
                    'Choose your interests.',
                    textAlign: TextAlign.start, // Centers the text
                    style: GoogleFonts.inter(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.5), // 50% opacity
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
            child: Column(
            children: List.generate(8, (index) {
    return Column(
    children: [
    customOutlinedButton(
    context: context,
    isSelected: isSelectedbutton[index], // Pass the specific state for each button
    onPressed: () {
    setState(() {
    isSelectedbutton[index] = !isSelectedbutton[index]; // Toggle the selected state of the button
    });
    },
    buttonText: buttonNames[index], // Pass dynamic text based on the index
    ),
    // Add space between buttons (same height for all)
    SizedBox(height: 10), // Height of 10 between all buttons
    ],
    );
    }
    ),

          ),
          ),
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Search()));
                // print('Login button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 12), // Button size
                minimumSize: Size(double.infinity, 50), // Full width (cover width) and height
              ),
              child: Text(
                'Next',
                style: GoogleFonts.inter(fontSize: 18, color: Colors.white, fontWeight: FontWeight.bold), // Text styling
              ),
            ),
          ),


        ],
      ),
    );
  }
}
