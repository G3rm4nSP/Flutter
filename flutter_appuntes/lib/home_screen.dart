import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.amber,
        title: Row(
          children: [
            const Icon(Icons.menu),
            Center(
              child: CircleAvatar(
                backgroundImage: Image.asset('assets/avatar.jpg').image,
              ),
            )
          ],
        ),
      ),
    );
  }
}
