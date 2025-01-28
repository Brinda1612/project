import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/otp.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  bool _isObscured = true;
  bool _isChecked = false; // To track the state of the checkbox

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 50, 24, 0),
            child: Row(
              children: [
                Text(
                  'Sign up',
                  style: TextStyle(
                    fontSize: 16, // Font size
                    fontWeight: FontWeight.w900, // Optional: to make it bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              children: [
                Text(
                  'Create an account to get start',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black
                        .withOpacity(0.5), // Optional: to make it bold
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            // padding: const EdgeInsets.all(16.0),
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),

            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Name', // Label text
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8), // Space between label and text field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  hintText: 'Enter your name',
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(
                'Email Address', // Label text
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 8), // Space between label and text field
              TextField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8), // Rounded corners
                  ),
                  hintText: 'name@gmail.com',
                ),
              ),
            ]),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Password', // Label text
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),

                SizedBox(height: 8), // Space between label and text field
                TextField(
                  obscureText: !_isObscured, // Obscure text when not visible
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    hintText: 'Enter your password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  obscureText: !_isObscured, // Obscure text when not visible
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8), // Rounded corners
                    ),
                    hintText: 'Confirm password',
                    suffixIcon: IconButton(
                      icon: Icon(
                        _isObscured ? Icons.visibility : Icons.visibility_off,
                      ),
                      onPressed: () {
                        setState(() {
                          _isObscured = !_isObscured;
                        });
                      },
                    ),
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: 24,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: Row(
              children: [
                SizedBox(
                  height: 24,
                  width: 24,
                  child: Checkbox(
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6), // Adjust the radius
                    ),
                    // visualDensity: VisualDensity(horizontal: -4, vertical: -4), // Adjust size

                    value: _isChecked,
                    onChanged: (bool? value) {
                      setState(() {
                        _isChecked =
                            value ?? false; // Update the checkbox state
                      });
                    },
                  ),
                ),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                  child: RichText(
                    text: TextSpan(
                      text: 'I’ve read and agree with the ',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                      children: [
                        TextSpan(
                          text: 'Terms and Condition',
                          style: TextStyle(
                            color: Colors.blue, // Blue text without underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle "Terms and Condition" tap
                              print('Terms and Condition tapped');
                            },
                        ),
                        TextSpan(
                          text: ' and the ',
                          style: TextStyle(color: Colors.black),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            color: Colors.blue, // Blue text without underline
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Handle "Privacy Policy" tap
                              print('Privacy Policy tapped');
                            },
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(25, 0, 25, 0),
            child: ElevatedButton(
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (ctx) => Otp()));
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
                'Sign up',
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
}
