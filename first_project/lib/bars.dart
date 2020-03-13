import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'data.dart';
import 'provincia.dart';


class Bars extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BarsState();

}

class BarsState extends State<Bars>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    final provinciaData = [
      new Provincia('SanJose',"Total", 1404242,"23782","9169","46533","15575","11765","9981","1248593", Colors.red),
      new Provincia('Alajuela',"Total",848146 ,"14081","5738","27374","9767","6765","5381","764280", Colors.red),
      new Provincia('Cartago',"Total", 490903,"7074","2785","14617","5241","4288","2904","445991", Colors.red),
      new Provincia('Heredia',"Total", 433677,"6113","2328","12296","4115","2858","2498","390512", Colors.red),
      new Provincia('Guanacaste',"Total", 326953,"5722","2775","11389","3883","3053","1904","291306", Colors.red),
      new Provincia('Puntarenas',"Total", 410929,"7564","3492","15157","5437","3762","2345","364610", Colors.red),
      new Provincia('Limon',"Total", 386862,"6373","3126","13014","4841","2925","1958","343571", Colors.red),
    ];

    final hombresData = [
      new Provincia('SanJose',"Hombres", 671469,"11599","4998","19297","6661","6488","4989","600779", Colors.red),
      new Provincia('Alajuela',"Hombres", 420888,"7780","3230","13153","4783","3885","2851","379021", Colors.red),
      new Provincia('Cartago',"Hombres", 240873,"3632","1560","6599","2432","2420","1587","219157", Colors.red),
      new Provincia('Heredia',"Hombres", 211246,"3169","1281","5468","1826","1666","1297","190657", Colors.red),
      new Provincia('Guanacaste',"Hombres", 161988,"3056","1640","5488","1906","1713","1033","144471", Colors.red),
      new Provincia('Puntarenas',"Hombres", 205959,"4414","2041","7534","2841","2154","1301","182159", Colors.red),
      new Provincia('Limon',"Hombres", 193640,"3590","1845","6732","2552","1642","1068","171424", Colors.red),
    ];

    final mujeresData = [
      new Provincia('SanJose',"Mujeres", 732773,"12183","4171","27236","8914","5277","4992","647814", Colors.red),
      new Provincia('Alajuela',"Mujeres", 427258,"6301","2508","14221","4984","2880","2530","385259", Colors.red),
      new Provincia('Cartago',"Mujeres", 250030,"3442","1225","8018","2809","1868","1317","226834", Colors.red),
      new Provincia('Heredia',"Mujeres", 222431,"2944","1047","6828","2289","1192","1201","199855", Colors.red),
      new Provincia('Guanacaste',"Mujeres",164965,"2666","1135","5901","1977","1340","871","146835", Colors.red),
      new Provincia('Puntarenas',"Mujeres",204970,"3150","1451","7623","2596","1608","1044","182451", Colors.red),
      new Provincia('Limon',"Mujeres",193222,"2783","1281","6282","2289","1283","890","172147", Colors.red),
    ];

    var series = [
      new charts.Series<Provincia, String>(
        id: 'Provincia',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: provinciaData,
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        fillColorFn: (_, __) =>
        charts.MaterialPalette.blue.shadeDefault.lighter,
      ),
      new charts.Series<Provincia, String>(
        id: 'Hombres',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: hombresData,
        colorFn: (_, __) => charts.MaterialPalette.red.shadeDefault,
        fillColorFn: (_, __) =>
        charts.MaterialPalette.red.shadeDefault.lighter,
      ),
      new charts.Series<Provincia, String>(
        id: 'Mujeres',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: mujeresData,
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        fillColorFn: (_, __) =>
        charts.MaterialPalette.green.shadeDefault.lighter,
      ),
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
      barGroupingType: charts.BarGroupingType.grouped,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico por rango de edad"),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
              'Costa Rica: Población total por condición y tipo de discapacidad, según provincia y sexo', textScaleFactor: 1.5
          ),
          Padding(
            padding: new EdgeInsets.all(32.0),
            child: new SizedBox(
              height: 300.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}

/// Sample ordinal data type.
class OrdinalSales {
  final String year;
  final int sales;

  OrdinalSales(this.year, this.sales);
}