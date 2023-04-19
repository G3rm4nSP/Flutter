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

  factory Producto.fromJson(Map<String, dynamic> json) => Producto(
        id: json["id"],
        nombre: json["nombre"],
        foto: Image.network(json["foto"]),
        precio: json["precio"].toDouble(),
        disponibles: json["disponibles"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "foto": foto,
        "precio": precio,
        "disponibles": disponibles,
      };
}
