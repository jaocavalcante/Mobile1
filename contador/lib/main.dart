// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:flutter/material.dart';
//Método principal - o primeiro a ser chamado para iniciar

void main() {
  runApp(const Aplicativo());
}

class Aplicativo extends StatefulWidget {
  const Aplicativo({Key? key}) : super(key: key);
  @override
  State<Aplicativo> createState() => _EstadoAplivativo();
}

class _EstadoAplivativo extends State<Aplicativo> {
  int contador1 = 0;
  int contador2 = 0;
  int _tempo = 60;
  late Timer _timer;
  bool _clique = true;
  Color cor1 = Colors.black;
  Color cor2 = Colors.black;
  double posicao = 0;
  void movimentar() {
    setState((){

        if (contador1 > contador2) {
          posicao = 50.0;
        } else if (contador2 > contador1) {
          posicao = MediaQuery.of(context).size.width - 350.0;
        } else {
          posicao = MediaQuery.of(context).size.width / 2 - 250.0;
        }
    });
  }

  void _reiniciar() {
    setState(() {
      contador1 = 0;
      contador2 = 0;
      _tempo = 60;
    });
    _timer.cancel();
    _iniciarTimer();
  }

  @override
  void initState() {
    super.initState();
    _iniciarTimer();
  }

  void dispose() {
    _timer.cancel();
    super.dispose;
  }

  void _iniciarTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_tempo > 0) {
          _tempo--;
        } else {
          _timer.cancel;
          _clique = false;
        }
      });
    });
  }

  void mudarCor() {
    if (contador1 > contador2) {
      cor1 = Colors.red;
      cor2 = Colors.black;
    } else if (contador2 > contador1) {
      cor1 = Colors.black;
      cor2 = Colors.red;
    } else {
      cor1 = Colors.blue;
      cor2 = Colors.blue;
    }
  }

  @override
  Widget build(BuildContext context) {
    mudarCor();

    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.indigoAccent,
          title: const Text('Jogo Contador'),
        ),
        body:  Stack(
          
           

          
          children: [
            
            Center(
               
                child: Column(
                  
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  Text(
                    'Contador 1: $contador1',
                    style: TextStyle(fontSize: 30, color: cor1),
                  ),
                  SizedBox(height: 20),
                  Text(
                    'Contador 2: $contador2',
                    style: TextStyle(fontSize: 30, color: cor2),
                  ),
                  Text(
                    'Tempo restante: $_tempo segundos',
                    style: TextStyle(fontSize: 30, color: Colors.green),
                  )
                ])),
            AnimatedPositioned(
              duration: Duration(milliseconds: 500),
              bottom: 0.0,
              top: 600,
              left: posicao ,
              curve: Curves.easeInOut,
              child: Image.network(
                'https://i.redd.it/07ksnxfh9gr81.gif',
                width: 400,
                height: 400,
              ),
            ),
          ],
        ),
        floatingActionButton: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Padding(
                  padding: const EdgeInsets.only(left:20.0),
                  child: FloatingActionButton(
                    // onPressed: _clique ? (){ setState(() { contador1++; }); } : null,
                    onPressed: () {
                      setState(() {
                        if (_clique == true) {
                          contador1++;
                          movimentar();
                        }
                      });
                    },
                    tooltip: 'Incrementar Contador 1',
                    child: Icon(Icons.add),
                  )),
              FloatingActionButton(
                onPressed: _reiniciar,
                tooltip: 'Zerar Contagem',
                child: Icon(Icons.refresh),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 20.00),
                child: FloatingActionButton(
                  onPressed: () {
                    setState(() {
                      if (_clique == true) {
                        contador2++;
                        movimentar();
                      }
                    });
                  },
                  tooltip: 'Incrementar contador 2',
                  child: Icon(Icons.add),
                ),
              ),
            ]),
      ),
    );
  }
}
