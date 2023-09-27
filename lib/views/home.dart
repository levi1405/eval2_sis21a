import 'dart:ffi';

import 'package:eval2_sis21a/views/pantalla.dart';
import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int _item=0;

  getDrawerItemWidget(int pos){
    switch (pos){
      case 0: return Pantalla(title: "Lista de Productos",style: TextStyle(),);
      
     
    }
  }

   void _setItemDrawer(int position){
     Navigator.pop(context); // close the drawer
     setState(() {
      _item = position;
    });
   }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
     appBar: AppBar(
       title: Text('Menu Drawer'),
     ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Text(
                'Menu Productos',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              selected: (0==_item),
              leading: Icon(Icons.home),
              title: Text('Home'),
              onTap: (){
                _setItemDrawer(0);
              },
            ),
            ListTile(
              selected: (1==_item),
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Pagina 1'),
              onTap: (){
                _setItemDrawer(1);
              },
            ),
            ListTile(
              selected: (2==_item),
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Pagina 2'),
              onTap: (){
                _setItemDrawer(2);
              },
            ),
            ListTile(
              selected: (3==_item),
           leading: Icon(Icons.arrow_forward_ios),
                title: Text('Pagina 3'),
              onTap: (){
                _setItemDrawer(3);
              },
            ),

          ],
        ),
      ),
         body: getDrawerItemWidget(_item),

    );
  }
}