import 'package:flutter/material.dart';
import 'package:flutter_nevera/pantalla_inicio_sesion/inicio_sesion.dart';
import 'package:flutter_nevera/pantalla_principal/app_bar.dart';
import 'package:flutter_nevera/pantalla_principal/home_screen.dart';
import 'package:sizer/sizer.dart';

class UserRegister extends StatelessWidget {
  const UserRegister({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 26, 83, 2),
      body: SafeArea(
          child: Stack(
        children: [
          const DecoratedBox(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 26, 83, 2),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: 100.w,
                height: 6.h,
                color: Colors.white,
                child: const DecoratedBox(
                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomRight: Radius.circular(50)),
                      color: Color.fromARGB(255, 26, 83, 2),
                      border: Border(
                        top: BorderSide(color: Colors.red, width: 1),
                      )),
                ),
              ),
              Container(
                width: 100.w,
                height: 70.h,
                child: DecoratedBox(
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Expanded(
                    child: Column(
                      children: [
                        TextField(
                          style: TextStyle(
                            fontSize: 12.sp,
                            fontWeight: FontWeight.bold,
                          ),
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(),
                            labelText: '   Nombre',
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
                            labelText: '   Apellido',
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
                            labelText: '   Correo',
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
                            labelText: '   Contraseña',
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
                            labelText: '   Confirmar Contraseña',
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
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const LogInScreen()),
                              );
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
                        SizedBox(height: 3.h),
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
                                Navigator.pop(context);
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
                ),
              ),
            ],
          ),
        ],
      )

          /**/
          ),
    );
  }
}
