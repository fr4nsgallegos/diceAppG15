import 'package:diceappg15/models/deport_model.dart';
import 'package:flutter/material.dart';

class FavoriteDeportsPage extends StatefulWidget {
  @override
  State<FavoriteDeportsPage> createState() => _FavoriteDeportsPageState();
}

class _FavoriteDeportsPageState extends State<FavoriteDeportsPage> {
  List<DeportModel> favoriteDeportList = [];

  Widget buildDeportButton(DeportModel variableDeporte, bool isOnBoxContainer) {
    return ElevatedButton(
      onPressed: () {
        if (variableDeporte.isFavorite == false) {
          variableDeporte.isFavorite = true;
          favoriteDeportList.add(variableDeporte);
        } else {
          variableDeporte.isFavorite = false;
          favoriteDeportList.remove(variableDeporte);
        }
        setState(() {});
      },

      child: Text(variableDeporte.nombre),
      style: ElevatedButton.styleFrom(
        backgroundColor: isOnBoxContainer
            ? Colors.white
            : variableDeporte.isFavorite
            ? Colors.orange
            : Colors.white,
        foregroundColor: isOnBoxContainer
            ? Colors.black
            : variableDeporte.isFavorite
            ? Colors.white
            : Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(10),
          side: BorderSide(color: Colors.orange, width: 2),
        ),
      ),
    );
  }

  Widget buildItem(DeportModel mandarina) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      decoration: BoxDecoration(
        color: mandarina.isFavorite == true ? Colors.orange : Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(width: 1.1, color: Colors.orange),
      ),
      child: Text(
        mandarina.nombre,
        style: TextStyle(
          fontSize: 16,
          color: mandarina.isFavorite ? Colors.white : Colors.black,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("SetState Texts App"),
        backgroundColor: Color(0xffEBA049),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "¿Cuales son tus deportes favoritos?",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Center(
              child: Wrap(
                spacing: 16, //espaciado horizontal entre los elementos
                runSpacing: 8, //espaciado vertical entre filas
                alignment: WrapAlignment.spaceAround, //alineación
                children: [
                  for (int i = 0; i < deportList.length; i++)
                    // buildItem(deportList[i]),
                    buildDeportButton(deportList[i], false),
                ],
              ),
            ),
            Divider(height: 40, thickness: 2, color: Colors.black),
            Text(
              "Mis deportes favoritos",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),

            Container(
              padding: EdgeInsets.all(20),
              width: double.infinity,
              // height: 350,
              decoration: BoxDecoration(
                // color: Colors.red,
                borderRadius: BorderRadius.circular(25),
                border: Border.all(color: Colors.black, width: 2),
              ),
              child: Wrap(
                spacing: 8,
                runSpacing: 8,
                alignment: WrapAlignment.spaceAround,
                children: [
                  for (int j = 0; j < favoriteDeportList.length; j++)
                    buildDeportButton(favoriteDeportList[j], true),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
