import 'package:flutter/material.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/inicio/inicio.dart';
import 'package:sizer/sizer.dart';

class RegisterBoxV2 extends StatelessWidget {
  const RegisterBoxV2({
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
                      "Register",
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
                          Container(
                            alignment: Alignment.centerLeft,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Looks like you don't have an acount.\nLets create a new acount for",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: colorScheme.onPrimary,
                                  ),
                                ),
                                Text(
                                  "example@lol.com",
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    color: colorScheme.onPrimary,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Formulary(dato: "Name"),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Formulary(dato: "Password", isPassword: true),
                          SizedBox(
                            height: 3.h,
                          ),
                          const Formulary(
                              dato: "Confirm Password", isPassword: true),
                          SizedBox(
                            height: 3.h,
                          ),
                          LogInButton(colorScheme: colorScheme),
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
        "Agree and continue",
        style: TextStyle(
          color: Colors.white,
          fontSize: 12.sp,
        ),
      ),
    );
  }
}
