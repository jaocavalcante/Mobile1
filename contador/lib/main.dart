// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';                   
//Método principal - o primeiro a ser chamado para iniciar
                                                          
void main() {                                             
  runApp(const Aplicativo());                             
}                                                         
                                                          
class Aplicativo extends StatefulWidget{                  
  const Aplicativo({Key?key}) : super(key:key);           
  @override                                               
  State<Aplicativo> createState() => _EstadoAplivativo(); 
                                                          
                                                          
}                                    

                                                          
                                                          
class _EstadoAplivativo extends State<Aplicativo> {     
      int contador1 = 0;
      int contador2 = 0;
      int _tempo = 60;
      late Timer _timer;
      bool _clique = true;
  @override                                               
  Widget build( BuildContext context) {
    return  MaterialApp(
    home: Scaffold(
    appBar: AppBar(
      backgroundColor: Colors.indigoAccent,
      title: const Text('Jogo Contador'),
    ),
     body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,

        children: [
          Text('Contador 1: $contador1', 
          style: TextStyle(fontSize: 30), 
          ),
          Text('Contador 1: $contador1', 
          style: TextStyle(fontSize: 30), 
          ),
          Text('Contador 1: $contador1', 
          style: TextStyle(fontSize: 30), 
          ),
        ]
      )
     ),
     floatingActionButton: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(left:50.0), 

          child: FloatingActionButton(
           // onPressed: _clique ? (){ setState(() { contador1++; }); } : null,
           onPressed: () {
            setState((){
              contador1++;
              });
              },
            tooltip: 'Incrementar Contador 1',
            child: Icon(Icons.add),
            )
          ),
      ]
     ),

    ),
    );
    
  }
}
 