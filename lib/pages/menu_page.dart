import 'package:diceappg15/models/menu_model.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  State<MenuPage> createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Map<String, dynamic>> menuList = [
    {
      "title": "Menú 1",
      "subtitle": "Lun - Mar - Mier",
      "price": 5.0,
      "imageUrl":
          "https://images.pexels.com/photos/28503582/pexels-photo-28503582.jpeg",
    },
    {
      "title": "Menú 2",
      "subtitle": "Mar - Mier",
      "price": 8.2,
      "imageUrl":
          "https://images.pexels.com/photos/28490807/pexels-photo-28490807.jpeg",
    },
    {
      "title": "Menú 3",
      "subtitle": "Vier - Sáb - Dom",
      "price": 10.5,
      "imageUrl":
          "https://images.pexels.com/photos/28490842/pexels-photo-28490842.jpeg",
    },
    {
      "title": "Menú 4",
      "subtitle": "Dom",
      "price": 15.5,
      "imageUrl":
          "https://images.pexels.com/photos/16811678/pexels-photo-16811678.jpeg",
    },
  ];

  Widget buildMenuCard(MenuModel menuModel) {
    return GestureDetector(
      onTap: () {
        menuModel.isSelected = !menuModel.isSelected;
        setState(() {});
      },
      child: Container(
        margin: EdgeInsets.only(bottom: 8),
        padding: EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: menuModel.isSelected == true ? Colors.orange : Colors.white,

          borderRadius: BorderRadius.circular(25),
          border: Border.all(width: 2, color: Colors.black),
        ),
        child: Row(
          children: [
            // PRIMERA FORMA DE PONER LA IMÁGEN CON BORDES REDONDEADOS
            // ClipRRect(
            //   borderRadius: BorderRadiusGeometry.circular(20),
            //   child: Image.network(
            //     "https://images.pexels.com/photos/28503582/pexels-photo-28503582.jpeg",
            //     width: 100,
            //     height: 100,
            //     fit: BoxFit.cover,
            //   ),
            // ),

            // SEGUNDA FORMA DE PONER UNA IMAGEN CON BORDES REDONDEADOS
            Container(
              height: 100,
              width: 100,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(menuModel.urlImage),
                ),
              ),
            ),

            // Image.network(
            //   "https://images.pexels.com/photos/28503582/pexels-photo-28503582.jpeg",
            //   width: 100,
            //   height: 100,
            //   fit: BoxFit.cover,
            // ),
            SizedBox(width: 16),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(menuModel.title, style: TextStyle(fontSize: 20)),
                Text(
                  menuModel.subtitle,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w300),
                ),
                Text(
                  "S/ ${menuModel.price.toString()}",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        title: Text("Setstate Cards Assets App"),
        centerTitle: true,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Selecciona tu mejor opción",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Column(
              children: List.generate(
                menuList.length,
                (index) => buildMenuCard(listMenuModel[index]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
