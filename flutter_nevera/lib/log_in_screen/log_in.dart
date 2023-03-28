import 'package:flutter/material.dart';
import 'package:flutter_nevera/home_screen/home.dart';
import 'package:flutter_nevera/register_screen/register.dart';
import 'package:sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
          child: Stack(
        children: [
          LogInBackground(colorScheme: colorScheme),
          LogInBox(colorScheme: colorScheme),
        ],
      )),
    );
  }
}

class LogInBackground extends StatelessWidget {
  const LogInBackground({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: const AssetImage("assets/nevera.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            colorScheme.primary,
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 3.h),
            Text("Bienvenido de nuevo!",
                style: TextStyle(
                  fontSize: 20.sp,
                  color: colorScheme.onPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center),
            SizedBox(height: 3.h),
            const Image(
              image: AssetImage("assets/logoCore.png"),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    );
  }
}

class LogInBox extends StatelessWidget {
  const LogInBox({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        EsquinaPagina(colorScheme: colorScheme),
        SizedBox(
          width: 100.w,
          height: 47.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
                color: colorScheme.primaryContainer,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(50),
                )),
            child: Column(
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      LogInData(colorScheme: colorScheme),
                      SizedBox(height: 2.h),
                      LogInPasswordOptions(colorScheme: colorScheme),
                      SizedBox(height: 3.h),
                      LogInButton(colorScheme: colorScheme),
                      SizedBox(height: 4.h),
                      NewAcount(colorScheme: colorScheme),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class LogInData extends StatelessWidget {
  const LogInData({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Formulary(dato: 'Correo'),
        Formulary(dato: 'Contraseña'),
      ],
    );
  }
}

class LogInPasswordOptions extends StatelessWidget {
  const LogInPasswordOptions({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        CheckboxMenuButton(
          value: true,
          onChanged: (value) {},
          child: Text(
            'Recordarme',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pushNamed(context, '/forgot');
          },
          child: Text(
            'Recuperar Contraseña',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
              color: colorScheme.primary,
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
    return SizedBox(
      width: 90.w,
      height: 9.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorScheme.primary),
        ),
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeScreen()),
          );
        },
        child: Text(
          'Iniciar Sesión',
          style: TextStyle(
            fontSize: 15.sp,
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class NewAcount extends StatelessWidget {
  const NewAcount({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿No tienes cuenta?',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const RegisterScreen()),
            );
          },
          child: Text(
            'Registrate',
            style: TextStyle(
              color: colorScheme.primary,
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class EsquinaPagina extends StatelessWidget {
  const EsquinaPagina({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;
  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 12.w,
          height: 6.h,
          color: colorScheme.primaryContainer,
        ),
        Container(
          width: 15.w,
          height: 7.5.h,
          margin: EdgeInsets.only(left: 85.w),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(50)),
              color: colorScheme.primary,
            ),
          ),
        ),
      ],
    );
  }
}
