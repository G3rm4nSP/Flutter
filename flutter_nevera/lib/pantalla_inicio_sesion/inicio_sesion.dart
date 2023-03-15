import 'package:flutter/material.dart';
import 'package:flutter_nevera/pantalla_principal/app_bar.dart';
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
          DecoratedBox(
            decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage("assets/nevera.jpg"), fit: BoxFit.cover),
            ),
            child: SizedBox(
              height: 60.h,
              width: 100.w,
              child: DecoratedBox(
                decoration: const BoxDecoration(
                    color: Color.fromARGB(202, 26, 83, 2),
                    borderRadius:
                        BorderRadius.only(bottomRight: Radius.circular(60))),
                child: Container(
                  padding: EdgeInsets.only(
                    top: 5.h,
                  ),
                  alignment: Alignment.topCenter,
                  child: Column(
                    children: [
                      Text(
                        "Bienvenido de nuevo!",
                        style: TextStyle(
                          fontSize: 20.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          LogInForm(colorScheme: colorScheme),
        ],
      )),
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
        Stack(
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
        ),
        Container(
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
                      SizedBox(height: 2.h),
                      Row(
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
                      ),
                      SizedBox(height: 4.h),
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
                            'Iniciar Sesión',
                            style: TextStyle(
                              fontSize: 15.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 4.h),
                      Row(
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
                              Navigator.pushNamed(context, '/register');
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
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        )
      ],
    );
  }
}
