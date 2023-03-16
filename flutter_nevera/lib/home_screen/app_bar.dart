import 'package:flutter/material.dart';

//BARRA SUPERIOR
class SuperiorBar extends StatelessWidget {
  const SuperiorBar({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Text("LA NEVERA"),
        CircleAvatar(
          backgroundImage: Image.asset('assets/avatar.jpg').image,
          radius: 25.0,
        )
      ],
    );
  }
}
