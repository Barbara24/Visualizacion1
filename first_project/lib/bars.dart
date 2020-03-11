import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'data.dart';


class Bars extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BarsState();

}

class BarsState extends State<Bars>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    var data = [
      new ClicksPerYear('2016', clicksCount[0], Colors.red),
      new ClicksPerYear('2017', clicksCount[1], Colors.yellow),
      new ClicksPerYear('2018', clicksCount[2], Colors.green),
    ];


    var series = [
      new charts.Series(
        id: 'Clicks',
        domainFn: (ClicksPerYear clickData, _) => clickData.year,
        measureFn: (ClicksPerYear clickData, _) => clickData.clicks,
        colorFn: (ClicksPerYear clickData, _) => clickData.color,
        data: data,
      ),
    ];

    var chart = new charts.BarChart(
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
                        title: Text(data[actualClickData].year),
                        content: Text("Clicks made: "+data[actualClickData].clicks.toString()),
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
              height: 200.0,
              child: chart,
            ),
          ),
        ],
      ),
    );
  }
}