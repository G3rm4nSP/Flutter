import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'cards_food.dart';
import 'cart_product.dart';
import 'drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var colorScheme = Theme.of(context).colorScheme;
    final List<CardFood> cards = List<CardFood>.generate(
      15,
      (i) => CardFood(
          nombre: 'Item $i',
          cantidad: i,
          precio: i * 10,
          image: AssetImage('assets/${(i + 1) % 10}.jpg'),
          colorScheme: colorScheme),
    );

    final List<CartProduct> cart = List<CartProduct>.generate(
      15,
      (i) => CartProduct(
          nombre: 'Item $i',
          cantidad: i,
          precio: i * 10,
          image: AssetImage('assets/${(i + 1) % 10}.jpg'),
          seleccionadas: i,
          colorScheme: colorScheme),
    );

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        appBar: AppBar(
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
                    print("Carrito");
                  },
                  tooltip: "Carrito",
                  icon: const Icon(Icons.shopping_cart))
            ],
          ),
          leading: Builder(
            builder: (BuildContext context) {
              return Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Ink(
                  decoration: ShapeDecoration(
                    color: colorScheme.inversePrimary,
                    shape: CircleBorder(
                        side: BorderSide(color: colorScheme.onPrimary)),
                  ),
                  child: const DecoratedBox(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          image: AssetImage("assets/avatar.jpg")),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
        drawer: PrincipalDrawer(colorScheme: colorScheme),
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                return cart[index];
              },
            ),
            /*FloattingBoxCart(
              colorScheme: colorScheme,
              total: 20,
              cart: cart,
            )*/
          ],
        ),
      ),
    );
  }
}

class FloattingBoxCart extends StatelessWidget {
  const FloattingBoxCart({
    super.key,
    required this.colorScheme,
    required this.total,
    required this.cart,
  });

  final List<CartProduct> cart;
  final double total;
  final ColorScheme colorScheme;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: colorScheme.onPrimary.withOpacity(0.8),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          const Text(
            "Carrito",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          ListView.builder(
            itemCount: cart.length,
            itemBuilder: (context, index) {
              return cart[index];
            },
          ),
          const Text(
            "No hay productos en el carrito",
            style: TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            'Total: $total €',
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(
            height: 10,
          ),
          const Divider(
            color: Colors.black,
            thickness: 1,
          ),
          const SizedBox(
            height: 10,
          ),
          ElevatedButton(
            onPressed: () {
              print("Comprar");
            },
            child: const Text("Comprar"),
          ),
        ],
      ),
    );
  }
}
