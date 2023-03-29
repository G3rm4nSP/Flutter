import 'package:flutter/material.dart';

class Producto {
  Producto({
    required this.id,
    required this.nombre,
    required this.foto,
    required this.precio,
    required this.disponibles,
  });

  final int id;
  final String nombre;
  final Image foto;
  final double precio;
  final int disponibles;
}
