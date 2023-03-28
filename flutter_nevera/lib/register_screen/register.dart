import 'package:flutter/material.dart';
import 'package:flutter_nevera/log_in_screen/log_in.dart';
import 'package:sizer/sizer.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: colorScheme.primary,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Expanded(
            child: Column(
              children: [
                RegisterBackground(colorScheme: colorScheme),
                RegisterBox(colorScheme: colorScheme),
              ],
            ),
          ),
        ),
      ),
      //bottomSheet: ButtonPlusLogin(colorScheme: colorScheme),
    );
  }
}

class RegisterBackground extends StatelessWidget {
  const RegisterBackground({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      child: const Column(
        children: [
          Image(image: AssetImage("assets/logoCore.png")),
        ],
      ),
    );
  }
}

class RegisterBox extends StatelessWidget {
  const RegisterBox({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GreenBox(colorScheme: colorScheme),
        SizedBox(
          child: DecoratedBox(
            decoration: BoxDecoration(
              color: colorScheme.primaryContainer,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(50),
              ),
            ),
            child: Column(
              children: [
                RegisterData(colorScheme: colorScheme),
                SizedBox(height: 3.h),
                RegisterButton(colorScheme: colorScheme),
                SizedBox(height: 2.h),
                ExistentAccount(colorScheme: colorScheme),
                SizedBox(height: 3.h),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class GreenBox extends StatelessWidget {
  const GreenBox({
    super.key,
    required this.colorScheme,
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
        SizedBox(
          width: 100.w,
          height: 7.5.h,
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                bottomRight: Radius.circular(50),
              ),
              color: colorScheme.primary,
            ),
            child: Row(
              children: [
                BotonBack(colorScheme: colorScheme),
                Text(
                  "Crear Cuenta",
                  style: TextStyle(
                    fontSize: 20.sp,
                    color: colorScheme.onPrimary,
                    fontWeight: FontWeight.bold,
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

class RegisterData extends StatelessWidget {
  const RegisterData({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Formulary(dato: 'Nombre'),
        Formulary(dato: 'Apellido'),
        Formulary(dato: 'Correo'),
        Formulary(dato: 'Contraseña'),
        Formulary(dato: 'Confirmar Contraseña'),
      ],
    );
  }
}

class Formulary extends StatelessWidget {
  const Formulary({
    super.key,
    required this.dato,
  });
  final String dato;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 1.h),
        TextField(
          obscureText: true,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: InputDecoration(
            border: const UnderlineInputBorder(),
            labelText: '   $dato',
          ),
        ),
      ],
    );
  }
}

class ExistentAccount extends StatelessWidget {
  const ExistentAccount({
    required this.colorScheme,
    super.key,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          '¿Ya tienes una cuenta?',
          style: TextStyle(
            fontSize: 12.sp,
          ),
        ),
        TextButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(
            'Inicia Sesión',
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

class RegisterButton extends StatelessWidget {
  const RegisterButton({
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
            MaterialPageRoute(builder: (context) => const LogInScreen()),
          );
        },
        child: Text(
          'Registrate',
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

class BotonBack extends StatelessWidget {
  const BotonBack({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 5.w, right: 8.w),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: colorScheme.inversePrimary,
          borderRadius: const BorderRadius.all(
            Radius.circular(30),
          ),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            size: 30,
          ),
          color: colorScheme.onSurface,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}
