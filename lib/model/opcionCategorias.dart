import 'package:flutter/material.dart';

class OpcionCategorias {
  final String titulo;
  final String imagen; // asset o url
  final VoidCallback accion;

  OpcionCategorias({
    required this.titulo,
    required this.imagen,
    required this.accion,
  });
}