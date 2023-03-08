//CARTAS
import 'package:flutter/material.dart';

class CardFood extends StatelessWidget {
  const CardFood({
    required this.text,
    super.key,
  });

  final String text;

  @override
  Widget build(BuildContext context) {
    const image = AssetImage('assets/platanos.jpg');
    return SizedBox(
      height: 150,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        margin: const EdgeInsets.only(bottom: 5, top: 5, left: 10, right: 10),
        elevation: 5,
        color: Theme.of(context).colorScheme.surfaceVariant,
        child: const DecoratedBox(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: image,
            ),
          ),
        ),
      ),
    );
  }
}
