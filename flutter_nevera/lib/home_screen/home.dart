import 'package:flutter/material.dart';
import 'app_bar.dart';
import 'cards_food.dart';

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

    return SafeArea(
      child: Scaffold(
        backgroundColor: colorScheme.primary,
        appBar: AppBar(
          backgroundColor: colorScheme.inversePrimary,
          title: SuperiorBar(colorScheme: colorScheme),
        ),
        body: ListView.builder(
          itemCount: cards.length,
          itemBuilder: (context, index) {
            return cards[index];
          },
        ),
        drawer: Drawer(
          // Add a ListView to the drawer. This ensures the user can scroll
          // through the options in the drawer if there isn't enough vertical
          // space to fit everything.
          child: ListView(
            // Important: Remove any padding from the ListView.
            padding: EdgeInsets.zero,
            children: [
              DrawerHeader(
                decoration: BoxDecoration(
                  color: colorScheme.secondary,
                ),
                child: const Text('Drawer Header'),
              ),
              ListTile(
                title: const Text('Item 1'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
              ListTile(
                title: const Text('Item 2'),
                onTap: () {
                  // Update the state of the app
                  // ...
                  // Then close the drawer
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}