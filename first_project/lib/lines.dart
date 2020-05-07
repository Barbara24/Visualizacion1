import 'package:charts_flutter/flutter.dart';
import 'package:first_project/genero.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/rendering.dart';
import 'package:syncfusion_flutter_charts/charts.dart';


class Lines extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => LinesState();

}

class LinesState extends State<Lines>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {

    final hombres = [
      new Genero("Hombre",14, 542618,"1844","4748","2523","1228","5686","1713","522484",Colors.blue,"0-14"),
      new Genero("Hombre",29, 589260,"2705","2870","4800","2465","6587","2948","559775",Colors.blue,"15-29"),
      new Genero("Hombre",59, 763923,"10727","4633","24450","9601","5975","5888","670212",Colors.blue,"30-59"),
      new Genero("Hombre",64, 65432,"2963","680","6209","2179","407","723","47898",Colors.blue,"60-64"),
      new Genero("Hombre",74, 86754,"7145","1336","11381","3537","638","1208","58280",Colors.blue,"65-74"),
      new Genero("Hombre",89, 53283,"9993","1923","12888","3456","574","1428","27492",Colors.blue,"75-89"),
      new Genero("Hombre",100, 4793,"1863","405","2020","535","101","218","1527",Colors.blue,"90-95"),
    ];

    var mujeres = [
      new Genero("Mujer",14, 525212,"1495","2583","2226","974","3885","911","509413",Colors.red,"0-14"),
      new Genero("Mujer",29, 604820,"2278","1940","3550","1488","4808","2009","576370",Colors.red,"15-29"),
      new Genero("Mujer",59, 826543,"9916","3726","24469","9929","4892","5370","725827",Colors.red,"30-59"),
      new Genero("Mujer",64, 72192,"2446","530","7581","2587","359","706","52518",Colors.red,"60-64"),
      new Genero("Mujer",74, 94828,"5713","1133","15329","4679","566","1268","62202",Colors.red,"65-74"),
      new Genero("Mujer",89, 64672,"9265","2203","19333","5132","757","2086","32517",Colors.red,"75-89"),
      new Genero("Mujer",100, 7382,"2356","703","3621","1069","181","495","2348",Colors.red,"90-95"),
    ];

    List<LineSeries<Genero, String>> getDefaultLineSeries(bool isTileView) {
      return <LineSeries<Genero, String>>[
        LineSeries<Genero, String>(
            color: Colors.blue,
            animationDuration: 2500,
            enableTooltip: true,
            dataSource: hombres,
            xValueMapper: (Genero genero, _) => genero.rango,
            yValueMapper: (Genero genero, _) => genero.poblacionTotal,
            width: 2,
            name: 'Hombres',
            markerSettings: MarkerSettings(isVisible: true)),
        LineSeries<Genero, String>(
            color: Colors.red,
            animationDuration: 2500,
            enableTooltip: true,
            dataSource: mujeres,
            width: 2,
            name: 'Mujeres',
            xValueMapper: (Genero genero, _) => genero.rango,
            yValueMapper: (Genero genero, _) => genero.poblacionTotal,
            markerSettings: MarkerSettings(isVisible: true))
      ];
    }

    var chart = new SfCartesianChart(
        series: getDefaultLineSeries(true),
        primaryXAxis: CategoryAxis(),
        legend: Legend(isVisible: true),
        trackballBehavior: TrackballBehavior(
            enable: true,
            tooltipDisplayMode: TrackballDisplayMode.nearestPoint,
            activationMode: ActivationMode.singleTap,
            tooltipAlignment: ChartAlignment.center,
        )
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico por género"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
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
              height: 410.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}
