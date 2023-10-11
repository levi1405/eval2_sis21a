
import 'package:eval2_sis21a/views/login_page.dart';
import 'package:eval2_sis21a/views/pantalla.dart';
import 'package:eval2_sis21a/views/registro.dart';
import 'package:eval2_sis21a/views/sign_up_auth.dart';
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
      case 1: return Registro();
      case 2: return ();
      // case 3: return SignUpPage();
      
     
    }
  }

   void setItemDrawer(int position){
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
              title: Text('Productos'),
              onTap: (){
                setItemDrawer(0);
              },
            ),
            ListTile(
              selected: (1==_item),
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Registro Producto'),
              onTap: (){
                setItemDrawer(1);
              },
            ),
            ListTile(
              selected: (2==_item),
              leading: Icon(Icons.arrow_forward_ios),
              title: Text('Cerrrar Sesión'),
              onTap: (){
                setItemDrawer(2);
              },
            ),
          //   ListTile(
          //     selected: (3==_item),
          //  leading: Icon(Icons.arrow_forward_ios),
          //       title: Text('SignUpPage'),
          //     onTap: (){
          //       setItemDrawer(3);
          //     },
          //   ),

          ],
        ),
      ),
         body: getDrawerItemWidget(_item),

    );
  }
}