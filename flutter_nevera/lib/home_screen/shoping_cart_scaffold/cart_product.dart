//CARTAS
// ignore_for_file: must_be_immutable
import 'package:flutter/material.dart';

class CartProduct extends StatelessWidget {
  CartProduct({
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.image,
    required this.total,
    this.seleccionadas = 0,
    super.key,
    required this.colorScheme,
  });

  double total;
  final ColorScheme colorScheme;
  final String nombre;
  final int cantidad;
  final double precio;
  final AssetImage image;
  int seleccionadas;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Divider(
          color: Colors.grey,
          thickness: 1,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Informacion(
                nombre: nombre,
                seleccionadas: seleccionadas,
                precio: precio,
                total: total,
                colorScheme: colorScheme),
            Column(
              children: [
                Imagen(image: image),
                Row(
                  children: [
                    ButtonCart(colorScheme: colorScheme, action: true),
                    Text('  $cantidad  '),
                    ButtonCart(colorScheme: colorScheme, action: false),
                  ],
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}

class Imagen extends StatelessWidget {
  const Imagen({
    super.key,
    required this.image,
  });

  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(right: 10),
      height: 50,
      width: 60,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: image),
        ),
      ),
    );
  }
}

class ButtonCart extends StatelessWidget {
  const ButtonCart({
    super.key,
    required this.colorScheme,
    required this.action,
  });

  final bool action;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return IconButton(
      style: ButtonStyle(
        iconSize: MaterialStateProperty.all(20),
        fixedSize: MaterialStateProperty.all(const Size(40, 40)),
        backgroundColor: MaterialStateProperty.all(colorScheme.inversePrimary),
        shape: MaterialStateProperty.all(
          CircleBorder(
            side: BorderSide(color: colorScheme.onPrimary),
          ),
        ),
      ),
      icon: (action ? const Icon(Icons.add) : const Icon(Icons.remove)),
      color: colorScheme.onPrimary,
      onPressed: () {
        //Navigator.pop(context);
      },
    );
  }
}

class Informacion extends StatelessWidget {
  const Informacion({
    super.key,
    required this.nombre,
    required this.seleccionadas,
    required this.precio,
    required this.total,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;
  final String nombre;
  final int seleccionadas;
  final double precio;
  final double total;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nombre,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 25,
              color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(height: 15),
        Text(
          'Total $total €',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colorScheme.onPrimaryContainer),
        ),
      ],
    );
  }
}
