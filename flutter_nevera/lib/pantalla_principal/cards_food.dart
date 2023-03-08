//CARTAS
import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    required this.nombre,
    required this.cantidad,
    required this.precio,
    required this.image,
    super.key,
  });

  final String nombre;
  final int cantidad;
  final double precio;
  final AssetImage image;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        elevation: 5,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(nombre),
                  Text('Cantidad / $cantidad'),
                  Text('Precio $precio €')
                ],
              ),
            ),
            SizedBox(
              height: 150,
              width: 150,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  image: DecorationImage(image: image),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
