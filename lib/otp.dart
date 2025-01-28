import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/interest.dart';

class Otp extends StatefulWidget {
  const Otp({super.key});

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  FocusNode _focusNode1 = FocusNode();
  FocusNode _focusNode2 = FocusNode();
  FocusNode _focusNode3 = FocusNode();
  FocusNode _focusNode4 = FocusNode();

  // Text controllers for OTP fields
  TextEditingController _controller1 = TextEditingController();
  TextEditingController _controller2 = TextEditingController();
  TextEditingController _controller3 = TextEditingController();
  TextEditingController _controller4 = TextEditingController();

  @override
  void dispose() {
    // Dispose focus nodes and controllers
    _focusNode1.dispose();
    _focusNode2.dispose();
    _focusNode3.dispose();
    _focusNode4.dispose();
    _controller1.dispose();
    _controller2.dispose();
    _controller3.dispose();
    _controller4.dispose();
    super.dispose();
  }

  // Move focus to the next field after entering a digit
  _onChanged(String text, FocusNode currentFocus, FocusNode nextFocus) {
    if (text.isNotEmpty) {
      nextFocus.requestFocus();
    }
  }

  // void _showDialog(BuildContext context) {
  //   showDialog(
  //     context: context,
  //     builder: (BuildContext context) {
  //       return AlertDialog(
  //         contentPadding: EdgeInsets.all(20),
  //         shape: RoundedRectangleBorder(
  //           borderRadius: BorderRadius.circular(16), // Border radius
  //         ),
  //         title: Center(
  //           child: Text(
  //             'Log out',
  //             style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
  //           ),
  //         ),
  //         content: SizedBox(
  //           width: 300, // Custom width
  //           height: 150, // Custom height
  //           child: Column(
  //             mainAxisSize: MainAxisSize.min, // Avoid unnecessary space
  //             children: [
  //               Row(
  //                 children: [
  //                   Text(
  //                     'Are you sure you want to log out? You\'ll \n'
  //                         'need to login again to use the app.',
  //                     style: GoogleFonts.inter(
  //                       fontSize: 14,
  //                       color: Colors.black.withOpacity(0.5), // 50% opacity
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //               Spacer(), // Adds space between text and buttons
  //               Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 children: [
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //                     child: OutlinedButton(
  //                       onPressed: () {
  //                         Navigator.of(context).pop(); // Close the dialog
  //                       },
  //                       child: Text('Cancel'),
  //                     ),
  //                   ),
  //                   Padding(
  //                     padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
  //                     child: ElevatedButton(
  //                       onPressed: () {
  //                         // Add logout logic here
  //                         print('Logout clicked');
  //                         Navigator.of(context).pop(); // Close the dialog
  //                       },
  //                       child: Text('Logout'),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ),
  //       );
  //     },
  //   );
  // }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(20),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15), // Rounded corners for the dialog
          ),
          title: Center(
            child: Text(
              'Log out',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w900),
            ),
          ),
          content: SizedBox(
            width: 300, // Custom width for the dialog
            child: Column(
              mainAxisSize: MainAxisSize.min, // Avoid unnecessary space
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Text(
                        'Are you sure you want to log out? You\'ll \n'
                            'need to login again to use the app.',
                        textAlign: TextAlign.center, // Centers the text
                        style: GoogleFonts.inter(
                          fontSize: 12,
                          color: Colors.black.withOpacity(0.5), // 50% opacity
                        ),
                      ),
                    ),
                  ],
                ),

                SizedBox(height: 20), // Space between text and buttons
                Container(
                  width: 268, // Specified width
                  height: 40, // Specified height
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          style: OutlinedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners for OutlinedButton
                              side: BorderSide(color: Colors.blue, width: 2), // Blue thin border
                            ),
                          ),
                          onPressed: () {
                            Navigator.of(context).pop(); // Close the dialog
                          },
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.w600,
                              color: Colors.blue,
                            ),
                          ),
                        ),
                      ),

                      // Expanded(
                      //   child: OutlinedButton(
                      //     style: OutlinedButton.styleFrom(
                      //       // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                      //       shape: RoundedRectangleBorder(
                      //         borderRadius: BorderRadius.circular(12), // Rounded corners for OutlinedButton
                      //       ),
                      //     ),
                      //     onPressed: () {
                      //       Navigator.of(context).pop(); // Close the dialog
                      //     },
                      //     child: Text('Cancel',
                      //       style: TextStyle(
                      //           fontSize: 12, fontWeight: FontWeight.w600, color: Colors.blue),
                      //     ),
                      //   ),
                      // ),

                      SizedBox(width: 12), // Space between the buttons
                      Expanded(
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            // padding: EdgeInsets.symmetric(horizontal: 12, vertical: 16),
                            backgroundColor: Colors.blue, // Blue background color
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12), // Rounded corners for ElevatedButton
                            ),
                          ),
                          onPressed: () {
                            // Add logout logic here
                            print('Logout clicked');
                            Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => Interest()));
                          },
                          child: Text('Logout',
        style: TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white),

        ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 120, 25, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Enter confirmation code',
                  style: TextStyle(
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.w900, // Optional: to make it bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            // Align text to the start
            children: [
              Text(
                'A 4-digit code sent to \n name@gmail.com',
                style: GoogleFonts.inter(
                  fontSize: 12,
                  color: Colors.black.withOpacity(0.5), // 50% opacity
                  // fontWeight: FontWeight.w500, // Optional: to make it bold
                ),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _otpTextField(_controller1, _focusNode1, _focusNode2),
              _otpTextField(_controller2, _focusNode2, _focusNode3),
              _otpTextField(_controller3, _focusNode3, _focusNode4),
              _otpTextField(_controller4, _focusNode4, _focusNode4),
              // Last field, no next
            ],
          ),
          SizedBox(
            height: 50,
          ),
          GestureDetector(
            onTap: () {
              // Handle resend code logic here
              print('Resend Code clicked');
            },
            child: Text(
              'Resend Code',
              style: TextStyle(
                color: Colors.blue, // Blue color
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          SizedBox(
            height: 40,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: ElevatedButton(
              onPressed: () {
                _showDialog(context);
                // Navigator.of(context)
                //     .push(MaterialPageRoute(builder: (ctx) => Otp()));
                // print('Login button pressed');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0), // Rounded corners
                ),
                padding: EdgeInsets.symmetric(vertical: 12), // Button size
                minimumSize: Size(
                    double.infinity, 50), // Full width (cover width) and height
              ),
              child: Text(
                'Continue',
                style: GoogleFonts.inter(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.bold), // Text styling
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _otpTextField(TextEditingController controller, FocusNode focusNode,
      FocusNode nextFocus) {
    return Container(
      width: 48,
      height: 48,
      margin: EdgeInsets.symmetric(horizontal: 8),
      child: TextField(
        controller: controller,
        focusNode: focusNode,
        maxLength: 1,
        onChanged: (text) => _onChanged(text, focusNode, nextFocus),
        decoration: InputDecoration(
          border: OutlineInputBorder(),
          counterText: '', // Hide the maxLength counter
          contentPadding:
              EdgeInsets.symmetric(vertical: 10.0, horizontal: 12.0),
        ),
        style: TextStyle(fontSize: 20),
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center, // Centers the text
      ),
    );
  }
}
