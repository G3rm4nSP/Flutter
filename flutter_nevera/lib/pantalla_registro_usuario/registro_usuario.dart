import 'package:flutter/material.dart';
import 'package:flutter_nevera/pantalla_principal/app_bar.dart';
import 'package:sizer/sizer.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      backgroundColor: colorScheme.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(height: 2.h),
                  TextField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Nombre',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Apellido',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Correo',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Contraseña',
                    ),
                  ),
                  SizedBox(height: 2.h),
                  TextField(
                    obscureText: true,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.bold,
                    ),
                    decoration: const InputDecoration(
                      border: UnderlineInputBorder(),
                      labelText: 'Confirmar Contraseña',
                    ),
                  ),
                  SizedBox(height: 5.h),
                  SizedBox(
                    width: 90.w,
                    height: 9.h,
                    child: ElevatedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                            colorScheme.primary),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/home');
                      },
                      child: Text(
                        'Registrate',
                        style: TextStyle(
                          fontSize: 15.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Row(
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
                          Navigator.pushNamed(context, '/register');
                        },
                        child: Text(
                          'Inicia Sesión',
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
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
