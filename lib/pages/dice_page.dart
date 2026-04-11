import 'dart:math';

import 'package:flutter/material.dart';

class DicePage extends StatefulWidget {
  @override
  State<DicePage> createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int nDado = 1;

  void shuffleDado() {
    nDado = Random().nextInt(6) + 1;
    setState(() {});
  }

  void aumentarDado() {
    nDado = nDado == 6 ? 1 : nDado += 1;

    // nDado = nDado + 1;
    // if (nDado == 6) {
    //   nDado = 1;
    // } else {
    //   nDado += 1; // es lo mismo que nDado=nDado + 1 ;
    // }
    setState(() {});
  }

  void disminuirDado() {
    nDado = nDado == 1 ? 6 : nDado -= 1;

    // nDado = nDado - 1;
    // if (nDado == 1) {
    //   nDado = 6;
    // } else {
    //   nDado -= 1; // es lo mismo que nDado=nDado - 1 ;
    // }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(title: Text("Dice App G15")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.red,

                // BORDES REDONDEADOS
                // primera forma: le da redondado a todas las esquinas
                borderRadius: BorderRadius.circular(16),

                // segunda forma: le da redondeado a algunas esquinas
                // borderRadius: BorderRadius.only(
                //   bottomLeft: Radius.circular(16),
                //   topRight: Radius.circular(25),
                // ),

                // Tercera forma
                // shape: BoxShape.circle, //convierte en circulo al container
              ),

              child: Image.asset(
                "assets/images/dice$nDado.png",
                height: 200,
                width: 200,
              ),
            ),
            SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    disminuirDado();
                  },
                  child: Icon(Icons.arrow_left_rounded, size: 50),
                ),
                ElevatedButton(
                  onPressed: () {
                    shuffleDado();
                  },
                  child: Icon(Icons.shuffle, size: 50),
                ),
                ElevatedButton(
                  onPressed: () {
                    aumentarDado();
                  },
                  child: Icon(Icons.arrow_right_rounded, size: 50),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
