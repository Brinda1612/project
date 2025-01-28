import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:project/sign_up.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

  bool _isObscured = true;

  
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset(
                'assets/login.png', // Replace with your image path.
                width: double.infinity,
                height: 250,
                fit: BoxFit.cover,
              ),
              SizedBox(height: 20,),
          
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 20, 24, 24),
                child: Row(
                 crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Welcome!',
                      // style: GoogleFonts.inter(
                      //   // color: Colors.blue, // Blue color
                      //   fontSize: 25, // Font size
                      //   fontWeight: FontWeight.bold,
                      // )
                      style: TextStyle(
                        // color: Colors.blue, // Blue color
                        fontSize: 24, // Font size
                        fontWeight: FontWeight.w900, // Optional: to make it bold
                      ),
                    ),
                  ],
                ),
              ),
          
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 24, 20),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    hintText: 'Email Address',
                  ),
                ),
              ),
          
             Padding(
               padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
               child: TextFormField(
                obscureText: _isObscured, // Controls password visibility
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15.0), // Rounded corners
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isObscured ? Icons.visibility : Icons.visibility_off,
                    ),
                    onPressed: () {
                      setState(() {
                        _isObscured = !_isObscured; // Toggle visibility
                      });
                    },
                  ),
                ),
               ),
             ),
              SizedBox(height: 10,),
          
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 0, 0, 0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start, // Align text to the start
                  children: [
                    Text(
                      'Forget password?',
                      style: GoogleFonts.inter(
                        color: Colors.blue, // Blue color
                        fontSize: 12, // Font size
                        fontWeight: FontWeight.w600, // Optional: to make it bold
                      ),
                    ),
                  ],
                ),
              ),
          SizedBox(height: 20,),
          
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
            child: ElevatedButton(
              onPressed: () {
                // Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignUp()));
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
                'Login',
                style: GoogleFonts.inter(fontSize: 12, color: Colors.white, fontWeight: FontWeight.w600), // Text styling
              ),
            ),
          ),
              SizedBox(height: 10,),
          
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align text to the start
                children: [
                  Text(
                    'Not a member?',
                    style: GoogleFonts.inter(
                      fontSize: 12,
                      color: Colors.black.withOpacity(0.5), // 50% opacity
                      // fontWeight: FontWeight.w500, // Optional: to make it bold
                    ),
                  ),
                  SizedBox(width: 5,),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => SignUp()));

                    },
                    child: Text(
                      'Register now',
                      style: GoogleFonts.inter(
                        color: Colors.blue, // Blue color
                        fontSize: 12, // Font size
                        fontWeight: FontWeight.bold, // Optional: to make it bold
                      ),
                    ),
                  ),
              
                ],
              ),
              SizedBox(height: 20,),
              Padding(
               padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Divider( // Line after Row with opacity
                  color: Colors.black.withOpacity(0.2), // Lighter line (20% opacity)
                  thickness: 1, // Thickness of the line
                  indent: 0, // Indentation from left
                  endIndent: 0, // Indentation from right
                ),
              ),
              SizedBox(height: 20,),
              Padding(
               padding: const EdgeInsets.fromLTRB(24, 0, 24, 0),
                child: Text(
                  'Or continue with',
                  style: GoogleFonts.inter(
                    fontSize: 12,
                    color: Colors.black.withOpacity(0.5), // 50% opacity
          // Font size
                    // fontWeight: FontWeight.w500, // Optional: to make it bold
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   _buildSocialButton(
                  icon: Icons.account_circle, // You can replace this with the Google icon
                  backgroundColor: Colors.red, // Google color
                  iconColor: Colors.white, // Icon color
                  onPressed: () {
                    // Google login action
                    print('Login with Google');
                  },
                ), _buildSocialButton(
                  icon: Icons.account_circle, // You can replace this with the Google icon
                  backgroundColor: Colors.black, // Google color
                  iconColor: Colors.white, // Icon color
                  onPressed: () {
                    // Google login action
                    print('Login with Google');
                  },
                ), _buildSocialButton(
                  icon: Icons.account_circle, // You can replace this with the Google icon
                  backgroundColor: Colors.blue, // Google color
                  iconColor: Colors.white, // Icon color
                  onPressed: () {
                    // Google login action
                    print('Login with Google');
                  },
                ),
                ],
              )
          
          
            ],
          ),
        ),
      ),
    );
  }
}

Widget _buildSocialButton({
  required IconData icon,
  required Color backgroundColor,
  required Color iconColor,
  required VoidCallback onPressed,
}) {
  return ElevatedButton(
    onPressed: onPressed,
    style: ElevatedButton.styleFrom(
      shape: CircleBorder(), backgroundColor: backgroundColor, // Circular shape
      padding: EdgeInsets.all(13), // Background color
    ),
    child: Icon(
      icon,
      color: iconColor, // Icon color
      size: 20, // Icon size
    ),
  );
}

