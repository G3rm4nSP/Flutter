//CARTAS
import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.image,
    this.seleccionadas = 0,
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;
  final String nombre;
  final int cantidad;
  final double precio;
  final AssetImage image;
  final int seleccionadas;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        elevation: 5,
        color: colorScheme.primaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BotonAdd(colorScheme: colorScheme),
            Informacion(
                nombre: nombre,
                seleccionadas: seleccionadas,
                cantidad: cantidad,
                precio: precio,
                colorScheme: colorScheme),
            Imagen(image: image),
          ],
        ),
      ),
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
      height: 140,
      width: 140,
      child: DecoratedBox(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(image: image),
        ),
      ),
    );
  }
}

class BotonAdd extends StatelessWidget {
  const BotonAdd({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Ink(
        decoration: ShapeDecoration(
          color: colorScheme.inversePrimary,
          shape: CircleBorder(side: BorderSide(color: colorScheme.onPrimary)),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            size: 45,
          ),
          color: colorScheme.onPrimary,
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
    );
  }
}

class Informacion extends StatelessWidget {
  const Informacion({
    super.key,
    required this.nombre,
    required this.seleccionadas,
    required this.cantidad,
    required this.precio,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;
  final String nombre;
  final int seleccionadas;
  final int cantidad;
  final double precio;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          nombre,
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 30,
              color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(height: 15),
        Text(
          'Seleccionadas: $seleccionadas / $cantidad',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
              color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(height: 5),
        Text(
          'Precio $precio €',
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: colorScheme.onPrimaryContainer),
        ),
      ],
    );
  }
}
