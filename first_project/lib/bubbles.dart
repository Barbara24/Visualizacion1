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
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    var data = [
      new Edades(14,1067830,"14471","3339","7331","4749","2202","9571","2624","1031897",Colors.red,"0-14"),
      new Edades(29,1067830,"30661","4983","4810","8350","3953","11395","4957","1136145",Colors.orange,"15-29"),
      new Edades(59,1590466,"117509","20643","8359","48919","19530","10867","11258","1396039",Colors.yellow,"30-59"),
      new Edades(64,137624,"22374","5409","1210","13790","4766","766","1429","100416",Colors.green,"60-64"),
      new Edades(74,181582,"34089","12858","2469","26710","8216","1204","2476","120482",Colors.lightBlue,"65-74"),
      new Edades(89,117955,"28368","19258","4126","32221","8588","1331","3514","60009",Colors.indigo,"75-89"),
      new Edades(95,12175,"3992","4219","1108","5641","1604","282","713","3875",Colors.purple,"90-95"),
    ];

    var series = [
      new charts.Series<Edades, int>(
        id: 'Edades',
        domainFn: (Edades edades, _) => edades.rangoEdades,
        measureFn: (Edades edades, _) => edades.poblacionTotal,
        colorFn: (Edades edades,_)  => edades.color,
        radiusPxFn: (Edades edades, _) => 10,
        data: data,
      )
    ];

    final staticTicks = <charts.TickSpec<int>>[
      new charts.TickSpec(
          14,
          label: "0-14",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          29,
          label: "15-29",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          59,
          label: "30-59",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          64,
          label: "60-64",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          74,
          label: "65-74",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          89,
          label: "75-89",
          style: new charts.TextStyleSpec(
              color: Color.black)),
      new charts.TickSpec(
          95,
          label: "90-95",
          style: new charts.TextStyleSpec(
              color: Color.black)),
    ];

    var chart = new charts.ScatterPlotChart(
      series,
      animate: true,
      domainAxis: new charts.NumericAxisSpec(
            tickProviderSpec: new charts.StaticNumericTickProviderSpec(staticTicks),
          renderSpec: new charts.SmallTickRendererSpec(
            labelStyle: new charts.TextStyleSpec(
                fontSize: 6,
                color: charts.MaterialPalette.black))
      ),
      selectionModels: [
        SelectionModelConfig(
            changedListener: (SelectionModel model) {
              if(model.hasDatumSelection) {
                actualClickData = model.selectedDatum[0].index;
                showDialog(
                    context: context,
                    builder: (BuildContext context){
                      return AlertDialog(
                        title: Text(data[actualClickData].rango),
                        content: Text("Población total: "+data[actualClickData].poblacionTotal.toString() + "\n" +
                        "Para ver aún con los anteojos o lentes puestos: " + data[actualClickData].lentesPuestos + "\n" +
                        "Para oir: " + data[actualClickData].oir + "\n" + "Para hablar: " + data[actualClickData].hablar + "\n" +
                            "Para caminar y subir gradas: " + data[actualClickData].caminar + "\n" +
                            "Para utilizar brazos o manos: " + data[actualClickData].brazos + "\n" + "Tipo intelectual: " + data[actualClickData].intelectual + "\n" +
                            "Del tipo mental: " + data[actualClickData].mental + "\n"),
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
              height: 450.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}