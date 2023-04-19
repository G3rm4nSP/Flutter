//CARTAS
import 'package:flutter/material.dart';

class CardFood extends StatefulWidget {
  const CardFood({
    super.key,
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.image,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;
  final String nombre;
  final int cantidad;
  final double precio;
  final AssetImage image;
  @override
  State<CardFood> createState() => _CardFoodState();
}

class _CardFoodState extends State<CardFood> {
  CardFood get widget => super.widget;

  int _seleccionadas = 0;
  int _cantidad = 20;
  void _seleccionar(int add) {
    setState(() {
      if (_cantidad >= _seleccionadas + add) _seleccionadas += add;
    });

    //total del carrito = total + precio;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        elevation: 5,
        color: super.widget.colorScheme.primaryContainer,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            BotonAdd(
              colorScheme: super.widget.colorScheme,
              onChanged: _seleccionar,
            ),
            Informacion(
                nombre: super.widget.nombre,
                seleccionadas: _seleccionadas,
                cantidad: super.widget.cantidad,
                precio: super.widget.precio,
                colorScheme: super.widget.colorScheme),
            Imagen(image: super.widget.image),
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
    required this.onChanged,
  });
  final ValueChanged<int> onChanged;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: IconButton(
        style: ButtonStyle(
          iconSize: MaterialStateProperty.all(40),
          fixedSize: MaterialStateProperty.all(const Size(55, 55)),
          backgroundColor:
              MaterialStateProperty.all(colorScheme.inversePrimary),
          shape: MaterialStateProperty.all(
            CircleBorder(
              side: BorderSide(color: colorScheme.onPrimary),
            ),
          ),
        ),
        icon: Icon(
          fill: BorderSide.strokeAlignCenter,
          Icons.add,
          color: colorScheme.onPrimary,
        ),
        onPressed: () {
          onChanged(1);
        },
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
