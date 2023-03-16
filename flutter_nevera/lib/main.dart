import 'package:flutter/material.dart';
import 'package:flutter_nevera/log_in_screen/log_in.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/register_screen/register.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Nevera',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: const Color.fromARGB(255, 255, 255, 0)),
            useMaterial3: true,
          ),
          home: const LogInScreen(),
        );
      },
    );
  }
}
