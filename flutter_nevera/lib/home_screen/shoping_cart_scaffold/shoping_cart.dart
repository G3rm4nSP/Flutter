import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'cart_product.dart';

class ShoppingCart extends StatelessWidget {
  const ShoppingCart({
    super.key,
    required this.colorScheme,
    required this.totalCesta,
  });

  final ColorScheme colorScheme;
  final double totalCesta;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: FloattingBoxCart(
        colorScheme: colorScheme,
        totalCesta: totalCesta,
      ),
    );
  }
}

class FloattingBoxCart extends StatefulWidget {
  const FloattingBoxCart({
    super.key,
    required this.colorScheme,
    required this.totalCesta,
  });

  final double totalCesta;
  final ColorScheme colorScheme;

  @override
  State<FloattingBoxCart> createState() => FloattingBoxCartState();
}

class FloattingBoxCartState extends State<FloattingBoxCart> {
  var cart = <CartProduct>[];

  void _anadirProducto(CartProduct product) {
    setState(() {
      var inser = false;
      for (var prodX in cart) {
        if (prodX.nombre == product.nombre) {
          prodX.seleccionadas += 1;
          prodX.total = prodX.precio * prodX.seleccionadas;
          inser = true;
          return;
        }
      }
      if (!inser) cart.add(product);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Center(
          child: Text(
            "Cesta de la Compra",
            style: TextStyle(fontSize: 20),
          ),
        ),
      ),
      body: ListView.builder(
        itemCount: cart.length,
        itemBuilder: (
          context,
          index,
        ) {
          return cart[index];
        },
      ),
      bottomNavigationBar: BottomAppBar(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            PayButton(colorScheme: colorScheme),
            Text("Total: $totalCesta", style: const TextStyle(fontSize: 20)),
          ],
        ),
      ),
    );
  }
}

class PayButton extends StatelessWidget {
  const PayButton({
    super.key,
    required this.colorScheme,
  });

  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 25.w,
      height: 9.h,
      child: ElevatedButton(
        style: ButtonStyle(
          backgroundColor:
              MaterialStateProperty.all<Color>(colorScheme.primary),
        ),
        onPressed: () {
          Navigator.pop(context);
        },
        child: Text(
          'Pagar',
          style: TextStyle(
            fontSize: 15.sp,
            color: colorScheme.onPrimary,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
