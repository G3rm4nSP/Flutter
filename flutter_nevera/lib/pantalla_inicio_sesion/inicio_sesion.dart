import 'package:flutter/material.dart';
import 'package:flutter_nevera/pantalla_principal/app_bar.dart';
import 'package:flutter_nevera/pantalla_principal/home_screen.dart';
import 'package:flutter_nevera/pantalla_registro_usuario/registro_usuario.dart';
import 'package:sizer/sizer.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      body: SafeArea(
          child: Stack(
        children: [
          const FondoInicio(),
          LogInForm(colorScheme: colorScheme),
        ],
      )),
    );
  }
}

class FondoInicio extends StatelessWidget {
  const FondoInicio({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/nevera.jpg"),
          fit: BoxFit.cover,
          colorFilter: ColorFilter.mode(
            Color.fromARGB(255, 26, 83, 2),
            BlendMode.hardLight,
          ),
        ),
      ),
      child: Container(
        alignment: Alignment.topCenter,
        child: Column(
          children: [
            SizedBox(height: 3.h),
            Text(
              "Bienvenido de nuevo!",
              style: TextStyle(
                fontSize: 20.sp,
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 3.h),
            const Image(image: AssetImage("assets/logoCore.png")),
          ],
        ),
      ),
    );
  }
}

class LogInForm extends StatelessWidget {
  const LogInForm({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const EsquinaPagina(),
        WhiteBox(colorScheme: colorScheme),
      ],
    );
  }
}

class WhiteBox extends StatelessWidget {
  const WhiteBox({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.transparent,
      width: 100.w,
      height: 47.h,
      child: DecoratedBox(
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50),
            )),
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  const LogInData(),
                  SizedBox(height: 2.h),
                  const PasswordOptions(),
                  SizedBox(height: 4.h),
                  BotonInicioSesion(colorScheme: colorScheme),
                  SizedBox(height: 4.h),
                  const Registro(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Registro extends StatelessWidget {
  const Registro({
    super.key,
  });

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
              MaterialPageRoute(builder: (context) => const UserRegister()),
            );
          },
          child: Text(
            'Registrate',
            style: TextStyle(
              fontSize: 12.sp,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}

class BotonInicioSesion extends StatelessWidget {
  const BotonInicioSesion({
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
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}

class PasswordOptions extends StatelessWidget {
  const PasswordOptions({
    super.key,
  });

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
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: '   Correo',
          ),
        ),
        TextField(
          obscureText: true,
          style: TextStyle(
            fontSize: 12.sp,
            fontWeight: FontWeight.bold,
          ),
          decoration: const InputDecoration(
            border: UnderlineInputBorder(),
            labelText: '   Contraseña',
          ),
        ),
      ],
    );
  }
}

class EsquinaPagina extends StatelessWidget {
  const EsquinaPagina({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomRight,
      children: [
        Container(
          width: 12.w,
          height: 6.h,
          color: Colors.white,
        ),
        Container(
          width: 15.w,
          height: 7.5.h,
          margin: EdgeInsets.only(left: 85.w),
          color: Colors.transparent,
          child: const DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomRight: Radius.circular(50)),
              color: Color.fromARGB(255, 23, 74, 1),
            ),
          ),
        ),
      ],
    );
  }
}
