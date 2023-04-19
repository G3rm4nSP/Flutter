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
                      "Log in",
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
                          Row(
                            children: [
                              const CircleAvatar(
                                radius: 35,
                                backgroundImage:
                                    AssetImage('assets/avatar.jpg'),
                              ),
                              Container(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Monkey Joe",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: colorScheme.onPrimary,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      "monkey@email.com",
                                      style: TextStyle(
                                        fontSize: 12.sp,
                                        color: colorScheme.onPrimary,
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Formulary(
                            dato: "Password",
                            isPassword: true,
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          LogInButton(colorScheme: colorScheme),
                          SizedBox(
                            height: 3.h,
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            child:
                                ForgotPasswordButton(colorScheme: colorScheme),
                          ),
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
          color: colorScheme.onPrimary,
          fontSize: 13.sp,
        ),
      ),
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
