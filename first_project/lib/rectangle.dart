/// Scatter plot chart example
import 'package:charts_flutter/flutter.dart' as charts;
import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:charts_flutter/flutter.dart';

class ShapeScatterPlotChart extends StatefulWidget {

  State<StatefulWidget> createState() => RectangleState();

}

class RectangleState extends State<ShapeScatterPlotChart>{
  List<int> clicksCount = [12,24,10];
  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    var data = [
      new LinearSales(0, 5, 3.0),
      new LinearSales(10, 25, 5.0),
      new LinearSales(12, 75, 4.0),
      new LinearSales(13, 225, 5.0),
      new LinearSales(16, 50, 4.0),
      new LinearSales(24, 75, 3.0),
      new LinearSales(25, 100, 3.0),
      new LinearSales(34, 150, 5.0),
      new LinearSales(37, 10, 4.5),
      new LinearSales(45, 300, 8.0),
      new LinearSales(52, 15, 4.0),
      new LinearSales(56, 200, 7.0),
    ];

    final maxMeasure = 300;

    var series = [
      new charts.Series<LinearSales, int>(
        id: 'Sales',
        // Providing a color function is optional.
        colorFn: (LinearSales sales, _) {
          // Bucket the measure column value into 3 distinct colors.
          final bucket = sales.sales / maxMeasure;


          if (bucket < 1 / 3) {
            return charts.MaterialPalette.blue.shadeDefault;
          } else if (bucket < 2 / 3) {
            return charts.MaterialPalette.red.shadeDefault;
          } else {
            return charts.MaterialPalette.green.shadeDefault;
          }
        },
        domainFn: (LinearSales sales, _) => sales.year,
        measureFn: (LinearSales sales, _) => sales.sales,
        // Providing a radius function is optional.
        radiusPxFn: (LinearSales sales, _) => sales.radius,
        data: data,
      )
        ..setAttribute(charts.pointSymbolRendererIdKey, 'rect')
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
                          title: Text(data[actualClickData].year.toString()),
                          content: Text("Clicks made: "+data[actualClickData].sales.toString()),
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
        defaultRenderer:
        new charts.PointRendererConfig<num>(customSymbolRenderers: {
          'circle': new charts.CircleSymbolRenderer(),
          'rect': new charts.RectSymbolRenderer(),
        })
    );
    return Scaffold(
      appBar: AppBar(
        title: Text("Bubbles"),
        centerTitle: true,
      ),
      body:  Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          new Text(
            'You have pushed the button this many times:',
          ),
          new Text(
            '${clicksCount[actualClickData]}',
            style: Theme.of(context).textTheme.display1,
          ),
          Padding(
            padding: new EdgeInsets.all(32.0),
            child: new SizedBox(
              height: 200.0,
              child: chart,
            ),
          ),
          FlatButton(
            child: Icon(Icons.add),
            color: Colors.cyan,
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(100)),
            onPressed: (){
              setState(() {
                ++clicksCount[actualClickData];
              });
            },
          )
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