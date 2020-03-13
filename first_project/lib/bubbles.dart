/// Scatter plot chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:first_project/edades.dart';
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart';
import 'edades.dart';

class SimpleScatterPlotChart extends StatefulWidget {

  State<StatefulWidget> createState() => BubblesState();

}

class BubblesState extends State<SimpleScatterPlotChart>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    var data = [
      new Edades(14,1067830,"3339","7331","4749","2202","9571","2624","1031897",Colors.red),
      new Edades(29,1067830,"4983","4810","8350","3953","11395","4957","1136145",Colors.red),
      new Edades(59,1590466,"20643","8359","48919","19530","10867","11258","1396039",Colors.red),
      new Edades(64,137624,"5409","1210","13790","4766","766","1429","100416",Colors.red),
      new Edades(74,181582,"12858","2469","26710","8216","1204","2476","120482",Colors.red),
      new Edades(89,117955,"19258","4126","32221","8588","1331","3514","60009",Colors.red),
      new Edades(95,12175,"4219","1108","5641","1604","282","713","3875",Colors.red),
    ];

    final maxMeasure = 300;

    var series = [
      new charts.Series<Edades, int>(
        id: 'Edades',
        // Providing a color function is optional.
        colorFn: (Edades edades, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = edades.poblacionTotal / maxMeasure;


          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (Edades edades, _) => edades.rangoEdades,
        measureFn: (Edades edades, _) => edades.poblacionTotal,
        // Providing a radius function is optional.
        radiusPxFn: (Edades edades, _) => 10,
        data: data,
      )
    ];

    var chart = new charts.ScatterPlotChart(
      series,
      animate: true,
      selectionModels: [
        SelectionModelConfig(
            changedListener: (SelectionModel model) {
              if(model.hasDatumSelection) {
                actualClickData = model.selectedDatum[0].index;
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text(data[actualClickData].rangoEdades.toString()),
                        content: Text("Clicks made: "+data[actualClickData].poblacionTotal.toString()),
                        actions: <Widget>[
                          FlatButton(
                            child: Text("Close"),
                            onPressed: (){
                              Navigator.of(context).pop();
                            },
                          )
                        ],
                      );
                    }
                );
                setState(() {

                });
              }
            }
        )
      ],
    );

    return Scaffold(
      appBar: AppBar(
        title: Text("Gráfico por provincias"),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'Costa Rica: Población total por condición y tipo de discapacidad, según grupos de edad', textScaleFactor: 1.5
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

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;
  final double radius;

  LinearSales(this.year, this.sales, this.radius);
}