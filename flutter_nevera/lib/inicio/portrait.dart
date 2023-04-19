import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/inicio/inicio.dart';
import 'package:sizer/sizer.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';

class Portrait extends StatelessWidget {
  const Portrait({
    required this.colorScheme,
    required this.isVisible,
    super.key,
  });

  final bool isVisible;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 30.h,
            ),
            Padding(
              padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
              child: Column(
                children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(bottom: 2.h, left: 2.h),
                    child: Text(
                      "Hi!",
                      style: TextStyle(
                        fontSize: 20.sp,
                        color: colorScheme.onPrimary,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  DecoratedBox(
                    decoration: BoxDecoration(
                      //color: colorScheme.onPrimaryContainer.withOpacity(.8),
                      gradient: LinearGradient(
                        colors: [
                          colorScheme.primary.withOpacity(0.9),
                          colorScheme.onPrimaryContainer.withOpacity(0.9),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Container(
                      margin: EdgeInsets.all(3.h),
                      child: Column(
                        children: [
                          const Formulary(dato: "Email"),
                          SizedBox(
                            height: 3.h,
                          ),
                          LogInButton(colorScheme: colorScheme),
                          SizedBox(
                            height: 3.h,
                          ),
                          const FacebookButton(),
                          SizedBox(
                            height: 3.h,
                          ),
                          const GoogleButton(),
                          SizedBox(
                            height: 3.h,
                          ),
                          SignUpButton(colorScheme: colorScheme),
                          SizedBox(
                            height: 1.h,
                          ),
                          ForgotPasswordButton(colorScheme: colorScheme),
                        ],
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
  }
}

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(100.w, 7.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      onPressed: () async {
        try {
          final LoginResult result = await FacebookAuth.instance.login();

          if (result.status == LoginStatus.success) {
            final AccessToken accessToken = result.accessToken!;
            // Aquí puedes hacer lo que quieras con el accessToken
            // ignore: use_build_context_synchronously
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        } catch (e) {
          print("jajaja gay");
          // Manejar errores de inicio de sesión de Facebook
        }
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: Icon(
              Icons.facebook,
              color: Colors.blue,
              size: 25.sp,
            ),
          ),
          Text(
            "Continue with Facebook",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class GoogleButton extends StatefulWidget {
  const GoogleButton({
    Key? key,
  }) : super(key: key);

  @override
  _GoogleButtonState createState() => _GoogleButtonState();
}

class _GoogleButtonState extends State<GoogleButton> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn();

  Future<UserCredential?> _signInWithGoogle() async {
    // Start the sign-in process with Google
    final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
    if (googleUser == null) return null;

    // Obtain the auth details from the Google sign in
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;

    // Create a new credential for Firebase with the Google auth details
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth.accessToken,
      idToken: googleAuth.idToken,
    );

    // Sign in to Firebase with the Google credential
    return await _auth.signInWithCredential(credential);
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        fixedSize: MaterialStateProperty.all(Size(100.w, 7.h)),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
      ),
      onPressed: () async {
        // Sign in with Google and handle any errors
        try {
          final UserCredential? userCredential = await _signInWithGoogle();
          if (userCredential != null) {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          }
        } catch (e) {
          print('Error signing in with Google: $e');
        }
      },
      child: Row(
        children: [
          Padding(
            padding: EdgeInsets.only(right: 5.0.w),
            child: Image(
              image: const AssetImage("assets/googleLogo.png"),
              height: 23.sp,
            ),
          ),
          Text(
            "Continue with Google",
            style: TextStyle(
              color: Colors.black,
              fontSize: 15.sp,
            ),
          ),
        ],
      ),
    );
  }
}

class ForgotPasswordButton extends StatelessWidget {
  const ForgotPasswordButton({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Text(
        "Forgot your password?",
        style: TextStyle(
          color: colorScheme.primaryContainer,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}

class SignUpButton extends StatelessWidget {
  const SignUpButton({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(
          "Don't have an account?",
          style: TextStyle(
            color: colorScheme.onPrimary,
            fontSize: 15.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const HomeScreen()),
            );
          },
          child: Text(
            "Sign Up",
            style: TextStyle(
              color: colorScheme.primaryContainer,
              fontSize: 15.sp,
            ),
          ),
        ),
      ],
    );
  }
}

class LogInButton extends StatelessWidget {
  const LogInButton({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(100.w, 7.h)),
          backgroundColor:
              MaterialStateProperty.all<Color>(colorScheme.primary),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
          )),
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const HomeScreen()),
        );
      },
      child: Text(
        "Continue",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
