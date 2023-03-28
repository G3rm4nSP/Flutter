import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'cards_food.dart';
import 'app_bar.dart';
import 'shoping_cart_scaffold/cart_product.dart';
import 'shoping_cart_scaffold/shoping_cart.dart';

import 'drawer.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool _carrito = false;

  void _mostrarCarrito(bool newValue) {
    setState(() {
      _carrito = newValue;
    });
  }

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

    //lista incrementable CartProduct

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        //APPBAR
        appBar: PreferredSize(
          preferredSize: Size(1.w, 7.h),
          child: HomeAppBar(
              colorScheme: colorScheme,
              mostrarCarrito: _mostrarCarrito,
              active: _carrito),
        ),

        drawer: PrincipalDrawer(colorScheme: colorScheme),
        //BODY
        body: Stack(
          children: [
            ListView.builder(
              itemCount: cards.length,
              itemBuilder: (
                context,
                index,
              ) {
                return cards[index];
              },
            ),
            SizedBox(
              height: _carrito ? 100.h : 0,
              child: ShoppingCart(
                colorScheme: colorScheme,
                totalCesta: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
