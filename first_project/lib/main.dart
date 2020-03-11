import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'lines.dart';
import 'bars.dart';
import 'bubbles.dart';


void main() => runApp(MaterialApp(home: Home()));

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Proyecto 1"),
        centerTitle: true,
        backgroundColor: Colors.cyan,
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: createButtons(context, Colors.pink, [
              ["Gráfico por rango de edad", SimpleScatterPlotChart()],
              ["Gráfico por provincias", Bars()],
              ["Gráfico por género",Lines()]
            ])
        ),
      ),
    );
  }

  List<Widget> createButtons(BuildContext context, Color color ,List<dynamic> buttonsInfo){
    List<Widget> ret = new List<Widget>();
    for(List button in buttonsInfo){
      ret.add(FlatButton(
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30.0)),
        child: Text(button[0], textScaleFactor: 1.5, style: TextStyle(color: Colors.white),),
        onPressed: (){
          Navigator.push(context, MaterialPageRoute(builder: (context) => button[1]));
        },
      )
      );
    }
    return ret;
  }

}