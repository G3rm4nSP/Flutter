import 'package:flutter/material.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/inicio/inicio.dart';
import 'package:sizer/sizer.dart';

class LogInBoxV2 extends StatelessWidget {
  const LogInBoxV2({
    required this.colorScheme,
    required this.is_visible,
    super.key,
  });

  final bool is_visible;
  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: is_visible,
      child: Padding(
        padding: EdgeInsets.only(left: 3.0.w, right: 3.0.w),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              padding: EdgeInsets.only(bottom: 2.h, left: 2.h),
              child: Text(
                "Log In",
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
                //color: colorScheme.primaryContainer.withOpacity(.8),
                gradient: LinearGradient(
                  colors: [
                    Colors.greenAccent.withOpacity(0.9),
                    Colors.green.withOpacity(0.9),
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
    );
  }
}

class FacebookButton extends StatelessWidget {
  const FacebookButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(100.w, 7.h)),
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

class GoogleButton extends StatelessWidget {
  const GoogleButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          fixedSize: MaterialStatePropertyAll(Size(100.w, 7.h)),
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
          color: colorScheme.onPrimaryContainer,
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
            color: colorScheme.primary,
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
              color: colorScheme.onPrimaryContainer,
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
        "Log In",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
