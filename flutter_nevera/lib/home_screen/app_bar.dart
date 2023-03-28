import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:sizer/sizer.dart';

class HomeAppBar extends StatelessWidget {
  HomeAppBar({
    super.key,
    required this.colorScheme,
    required this.mostrarCarrito,
    required this.active,
  });

  final ValueChanged<bool> mostrarCarrito;
  final bool active;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: colorScheme.inversePrimary,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          SizedBox(
            width: 5.w,
          ),
          const Text("LA NEVERA"),
          IconButton(
              onPressed: () {
                mostrarCarrito(!active);
              },
              tooltip: "Carrito",
              icon: const Icon(Icons.shopping_cart))
        ],
      ),
      leadingWidth: 80,
      leading: Builder(
        builder: (BuildContext context) {
          return Padding(
            padding: const EdgeInsets.only(left: 8.0, top: 5),
            child: Ink(
              decoration: ShapeDecoration(
                color: colorScheme.inversePrimary,
                shape: CircleBorder(
                    side: BorderSide(color: colorScheme.onPrimary)),
              ),
              child: const DecoratedBox(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image:
                      DecorationImage(image: AssetImage("assets/avatar.jpg")),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
