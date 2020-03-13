import 'dart:ui';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';

class Provincia {
  final String provincia;
  final String sexo;
  final int poblacionTotal;
  final String lentesPuestos;
  final String hablar;
  final String caminar;
  final String brazos;
  final String intelectual;
  final String mental;
  final String ninguna;
  final charts.Color color;


  Provincia(this.provincia,this.sexo, this.poblacionTotal, this.lentesPuestos, this.hablar, this.caminar, this.brazos, this.intelectual,
      this.mental,this.ninguna,Color color)
      : this.color = new charts.Color(
      r: color.red, g: color.green, b: color.blue, a: color.alpha);
}
