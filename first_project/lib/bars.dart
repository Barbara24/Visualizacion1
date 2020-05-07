import 'package:charts_flutter/flutter.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charts_flutter/flutter.dart' as charts;

import 'provincia.dart';


class Bars extends StatefulWidget{

  @override
  State<StatefulWidget> createState() => BarsState();

}

class BarsState extends State<Bars>{

  int actualClickData = 0;

  @override
  Widget build(BuildContext context) {
    final provinciaData = [
      new Provincia('San Jose',"Total", 1404242,"88721","23782","9169","46533","15575","11765","9981","1248593", Colors.green),
      new Provincia('Alajuela',"Total",848146 ,"44356","14081","5738","27374","9767","6765","5381","764280", Colors.green),
      new Provincia('Cartago',"Total", 490903,"22061","7074","2785","14617","5241","4288","2904","445991", Colors.green),
      new Provincia('Heredia',"Total", 433677,"24916","6113","2328","12296","4115","2858","2498","390512", Colors.green),
      new Provincia('Guanacaste',"Total", 326953,"19840","5722","2775","11389","3883","3053","1904","291306", Colors.green),
      new Provincia('Puntarenas',"Total", 410929,"25962","7564","3492","15157","5437","3762","2345","364610", Colors.green),
      new Provincia('Limon',"Total", 386862,"25608","6373","3126","13014","4841","2925","1958","343571", Colors.green),
    ];

    final hombresData = [
      new Provincia('San Jose',"Hombres", 671469,"37846","11599","4998","19297","6661","6488","4989","600779", Colors.blue),
      new Provincia('Alajuela',"Hombres", 420888,"20358","7780","3230","13153","4783","3885","2851","379021", Colors.blue),
      new Provincia('Cartago',"Hombres", 240873,"9940","3632","1560","6599","2432","2420","1587","219157", Colors.blue),
      new Provincia('Heredia',"Hombres", 211246,"11176","3169","1281","5468","1826","1666","1297","190657", Colors.blue),
      new Provincia('Guanacaste',"Hombres", 161988,"8809","3056","1640","5488","1906","1713","1033","144471", Colors.blue),
      new Provincia('Puntarenas',"Hombres", 205959,"12328","4414","2041","7534","2841","2154","1301","182159", Colors.blue),
      new Provincia('Limon',"Hombres", 193640,"12156","3590","1845","6732","2552","1642","1068","171424", Colors.blue),
    ];

    final mujeresData = [
      new Provincia('San Jose',"Mujeres", 732773,"50875","12183","4171","27236","8914","5277","4992","647814", Colors.pink),
      new Provincia('Alajuela',"Mujeres", 427258,"23998","6301","2508","14221","4984","2880","2530","385259", Colors.pink),
      new Provincia('Cartago',"Mujeres", 250030,"12121","3442","1225","8018","2809","1868","1317","226834", Colors.pink),
      new Provincia('Heredia',"Mujeres", 222431, "13740","2944","1047","6828","2289","1192","1201","199855", Colors.pink),
      new Provincia('Guanacaste',"Mujeres",164965,"11031","2666","1135","5901","1977","1340","871","146835", Colors.pink),
      new Provincia('Puntarenas',"Mujeres",204970,"13634","3150","1451","7623","2596","1608","1044","182451", Colors.pink),
      new Provincia('Limon',"Mujeres",193222,"13452","2783","1281","6282","2289","1283","890","172147", Colors.pink),
    ];

    var series = [
      new charts.Series<Provincia, String>(
        id: 'Provincia',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: provinciaData,
        labelAccessorFn: (Provincia d, _) =>
          '${d.poblacionTotal.toString()}',
        outsideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        insideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        colorFn: (_, __) => charts.MaterialPalette.green.shadeDefault,
      ),
      new charts.Series<Provincia, String>(
        id: 'Hombres',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: hombresData,
        labelAccessorFn: (Provincia d, _) =>
        '${d.poblacionTotal.toString()}',
        outsideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        insideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        colorFn: (_, __) => charts.MaterialPalette.blue.shadeDefault,
      ),
      new charts.Series<Provincia, String>(
        id: 'Mujeres',
        domainFn: (Provincia provincia, _) => provincia.provincia,
        measureFn: (Provincia provincia, _) => provincia.poblacionTotal,
        data: mujeresData,
        labelAccessorFn: (Provincia d, _) =>
        '${d.poblacionTotal.toString()}',
        outsideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        insideLabelStyleAccessorFn: (Provincia d, _) {
          return new charts.TextStyleSpec(color: charts.MaterialPalette.black);
        },
        colorFn: (_, __) => charts.MaterialPalette.pink.shadeDefault,
      ),
    ];

    var chart = new charts.BarChart(
      series,
      animate: true,
      vertical: false,
      barRendererDecorator: new charts.BarLabelDecorator<String>(),
      barGroupingType: charts.BarGroupingType.grouped,
      selectionModels: [
        SelectionModelConfig(
            changedListener: (SelectionModel model) {
              if(model.hasDatumSelection) {
                actualClickData = model.selectedDatum[0].index;
                var selectedDatum = model.selectedDatum;
                String idS = selectedDatum.first.datum.sexo;
                if(idS == "Total") {
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(provinciaData[actualClickData].provincia + " Total"),
                          content: Text("Población total: "+provinciaData[actualClickData].poblacionTotal.toString() + "\n" +
                              "Para ver aún con los anteojos o lentes puestos: " + provinciaData[actualClickData].lentesPuestos + "\n" +
                              "Para oir: " + provinciaData[actualClickData].oir + "\n" + "Para hablar: " + provinciaData[actualClickData].hablar + "\n" +
                              "Para caminar y subit gradas: " + provinciaData[actualClickData].caminar + "\n" +
                              "Para utilizar brazos o manos: " + provinciaData[actualClickData].brazos + "\n" + "Tipo intelectual: " + provinciaData[actualClickData].intelectual + "\n" +
                              "Del tipo mental: " + provinciaData[actualClickData].mental + "\n"),
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
                }
                else if(idS == "Hombres"){
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(hombresData[actualClickData].provincia+ " Hombres"),
                          content: Text("Población total: "+hombresData[actualClickData].poblacionTotal.toString() + "\n" +
                              "Para ver aún con los anteojos o lentes puestos: " + hombresData[actualClickData].lentesPuestos + "\n" +
                              "Para oir: " + hombresData[actualClickData].oir + "\n" + "Para hablar: " + hombresData[actualClickData].hablar + "\n" +
                              "Para caminar y subit gradas: " + hombresData[actualClickData].caminar + "\n" +
                              "Para utilizar brazos o manos: " + hombresData[actualClickData].brazos + "\n" + "Tipo intelectual: " + hombresData[actualClickData].intelectual + "\n" +
                              "Del tipo mental: " + hombresData[actualClickData].mental + "\n"),
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
                }
                else{
                  showDialog(
                      context: context,
                      builder: (BuildContext context){
                        return AlertDialog(
                          title: Text(mujeresData[actualClickData].provincia+ " Mujeres"),
                          content: Text("Población total: "+mujeresData[actualClickData].poblacionTotal.toString() + "\n" +
                              "Para ver aún con los anteojos o lentes puestos: " + mujeresData[actualClickData].lentesPuestos + "\n" +
                              "Para oir: " + mujeresData[actualClickData].oir + "\n" + "Para hablar: " + mujeresData[actualClickData].hablar + "\n" +
                              "Para caminar y subit gradas: " + mujeresData[actualClickData].caminar + "\n" +
                              "Para utilizar brazos o manos: " + mujeresData[actualClickData].brazos + "\n" + "Tipo intelectual: " + mujeresData[actualClickData].intelectual + "\n" +
                              "Del tipo mental: " + mujeresData[actualClickData].mental + "\n"),
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
                }
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
          backgroundColor: Colors.cyan,
        ),
        body:  Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
                'Costa Rica: Población total por condición y tipo de discapacidad, según provincia y sexo', textScaleFactor: 1.5
            ),
            Padding(
              padding: new EdgeInsets.all(0.0),
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