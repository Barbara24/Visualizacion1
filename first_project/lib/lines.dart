import 'package:charts_flutter/flutter.dart';
import 'package:first_project/genero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'data.dart';


class Lines extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LinesState();

}

class LinesState extends State<Lines>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    final myFakeDesktopData = [
      new Genero("Hombre",14, 542618,"1844","4748","2523","1228","5686","1713","522484",Colors.red),
      new Genero("Hombre",29, 589260,"2705","2870","4800","2465","6587","2948","559775",Colors.red),
      new Genero("Hombre",59, 763923,"10727","4633","24450","9601","5975","5888","670212",Colors.red),
      new Genero("Hombre",64, 65432,"2963","680","6209","2179","407","723","47898",Colors.red),
      new Genero("Hombre",74, 86754,"7145","1336","11381","3537","638","1208","58280",Colors.red),
      new Genero("Hombre",89, 53283,"9993","1923","12888","3456","574","1428","27492",Colors.red),
      new Genero("Hombre",100, 4793,"1863","405","2020","535","101","218","1527",Colors.red),
    ];

    var myFakeTabletData = [
      new Genero("Mujer",14, 525212,"1495","2583","2226","974","3885","911","509413",Colors.blue),
      new Genero("Mujer",29, 604820,"2278","1940","3550","1488","4808","2009","576370",Colors.blue),
      new Genero("Mujer",59, 826543,"9916","3726","24469","9929","4892","5370","725827",Colors.blue),
      new Genero("Mujer",64, 72192,"2446","530","7581","2587","359","706","52518",Colors.blue),
      new Genero("Mujer",74, 94828,"5713","1133","15329","4679","566","1268","62202",Colors.blue),
      new Genero("Mujer",89, 64672,"9265","2203","19333","5132","757","2086","32517",Colors.blue),
      new Genero("Mujer",100, 7382,"2356","703","3621","1069","181","495","2348",Colors.blue),
    ];


    var series = [
      new charts.Series<Genero, int>(
        id: 'Hombres',
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
        domainFn: (Genero genero, _) => genero.rangoEdades,
        measureFn: (Genero genero, _) => genero.poblacionTotal,
        data: myFakeDesktopData,
      ),
      new charts.Series<Genero, int>(
        id: 'Muejeres',
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
        domainFn: (Genero genero, _) => genero.rangoEdades,
        measureFn: (Genero genero, _) => genero.poblacionTotal,
        data: myFakeTabletData,
      ),
    ];

    var chart = new charts.LineChart(
      series,
      animate: true,
        defaultRenderer: new charts.LineRendererConfig(includePoints: true)
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico por género"),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Costa Rica: Población total por condición y tipo de discapacidad, sexo y grupos de edad', textScaleFactor: 1.5
          ),
          Padding(
            padding: new EdgeInsets.all(32.0),
            child: new SizedBox(
              height: 600.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}
