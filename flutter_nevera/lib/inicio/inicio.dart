import 'package:flutter/material.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/inicio/log_in_v2.dart';
import 'package:flutter_nevera/inicio/register_v2.dart';
import 'package:sizer/sizer.dart';

class Inicio extends StatelessWidget {
  const Inicio({super.key});
  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/nevera.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Stack(
          children: [
            InicioBackgroundV2(colorScheme: colorScheme),
            LogInBoxV2(
              colorScheme: colorScheme,
              is_visible: true,
            ),
            RegisterBoxV2(
              colorScheme: colorScheme,
              is_visible: false,
            ),
          ],
        ),
      ),
    );
  }
}

class InicioBackgroundV2 extends StatelessWidget {
  const InicioBackgroundV2({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 5.h,
        ),
        Container(
          alignment: Alignment.topCenter,
          child: const Image(
            image: AssetImage("assets/logoCore.png"),
            alignment: Alignment.center,
          ),
        ),
      ],
    );
  }
}

class Formulary extends StatelessWidget {
  const Formulary({
    super.key,
    required this.dato,
    this.isPassword = false,
  });
  final bool isPassword;
  final String dato;
  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(
          Radius.circular(12),
        ),
      ),
      child: TextField(
        obscureText: isPassword,
        decoration: InputDecoration(
          border: InputBorder.none,
          labelText: dato,
          labelStyle: TextStyle(
            color: Colors.grey,
            fontSize: 15.sp,
          ),
          contentPadding: EdgeInsets.only(left: 1.h, bottom: .5.h, top: 1.h),
        ),
        style: TextStyle(
          color: Colors.black,
          fontSize: 15.sp,
        ),
      ),
    );
  }
}
