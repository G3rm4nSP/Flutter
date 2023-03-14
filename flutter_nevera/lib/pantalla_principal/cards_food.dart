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
  });

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
        color: Theme.of(context).colorScheme.inversePrimary,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const BotonAdd(),
            Informacion(
              nombre: nombre,
              seleccionadas: seleccionadas,
              cantidad: cantidad,
              precio: precio,
            ),
            Imagen(image: image),
          ],
        ),
      ),
    );
  }

  void onPressed() {

    //onPressed aument a number that update the app flutter?
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
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: Ink(
        decoration: const ShapeDecoration(
          color: Color.fromARGB(156, 255, 255, 0),
          shape: CircleBorder(
              side: BorderSide(color: Color.fromARGB(170, 255, 255, 255))),
        ),
        child: IconButton(
          icon: const Icon(
            Icons.add,
            size: 45,
          ),
          color: const Color.fromARGB(255, 255, 255, 255),
          onPressed: () {},
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
  });

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
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 30, color: Colors.white),
        ),
        const SizedBox(height: 15),
        Text(
          'Seleccionadas: $seleccionadas / $cantidad',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 16, color: Colors.white),
        ),
        const SizedBox(height: 5),
        Text(
          'Precio $precio €',
          style: const TextStyle(
              fontWeight: FontWeight.bold, fontSize: 20, color: Colors.white),
        ),
      ],
    );
  }
}
