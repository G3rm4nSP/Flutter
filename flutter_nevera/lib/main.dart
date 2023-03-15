import 'package:flutter/material.dart';
import 'package:flutter_nevera/pantalla_inicio_sesion/inicio_sesion.dart';
import 'package:flutter_nevera/pantalla_principal/home_screen.dart';
import 'package:flutter_nevera/pantalla_registro_usuario/registro_usuario.dart';
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
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
            useMaterial3: true,
          ),
          home: const LogInScreen(),
        );
      },
    );
  }
}
