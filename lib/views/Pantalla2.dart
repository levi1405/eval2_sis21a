import 'package:eval2_sis21a/views/pantalla.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'editarform.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Editar Productos',
      home: ProductListScreen(),
    );
  }
}

class ProductListScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Lista de Productos'),
      ),
      body: ProductList(),
    );
  }
}

class ProductList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: FirebaseFirestore.instance.collection('tb_productos').snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return CircularProgressIndicator();
        }

        List<DocumentSnapshot> products = snapshot.data!.docs;
        return ListView.builder(
          itemCount: products.length,
          itemBuilder: (context, index) {
            DocumentSnapshot product = products[index];
            return Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.green), // Borde verde
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              ),
              margin: EdgeInsets.all(10),
              child: Card(
                elevation: 0, // Sin elevación
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(25)), // Redondizamos las esquina
                child: Column(
                  children: [
                    ListTile(
                      title: Text(product['nombre']),
                      subtitle: Text('PRECIO: ${product['precio']}\n STOCK: ${product['stock']}'),
                      titleTextStyle: TextStyle(
                        fontSize: 36,
                        color: Colors.black87,

                      ) ,

                      subtitleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                        letterSpacing: .5,
                        height: 3,
                        color: Colors.grey,
                        
                      ),
                      
                    ),

                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      IconButton(
                        icon: const Icon(Icons.edit),
                        color: Theme.of(context).primaryColorDark,
                        tooltip: 'Editar',
                        onPressed: () {
                          // Navega a la pantalla de edición y pasa el producto
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => EditProductScreen(product: product),
                          ));
                        },
                    
                      ),
                      IconButton(
                        icon: const Icon(Icons.delete),
                        color: Theme.of(context).errorColor,
                        tooltip: 'Eliminar',
                        onPressed: () {
                          // Elimina el producto
                          FirebaseFirestore.instance.collection('tb_productos').doc(product.id).delete();
                        },
                        
                      ),
                    ],
                  ),
                ],
              ),
              ),
            );
          },
        );
      },
    );
  }
  
  // deleteProducto(BuildContext context, String id) {
  //   showDialog<void>(
  //     context: context,
  //     barrierDismissible: false,
  //     builder: (BuildContext dialogContext){
  //       return AlertDialog(
  //         content: SingleChildScrollView(
  //           child: ListBody(
  //             children: <Widget>[
  //               Text("¿Está seguro que desea eliminar este producto?"),
  //               ],
  //               ),
  //               ),
  //               actions: <Widget>[
  //                 ElevatedButton(
  //                   child: const Text('Cancelar'),
  //                   onPressed: () {
  //                     Navigator.pop(dialogContext);
  //                     },
  //                     ),
  //                     ElevatedButton(
  //                       child: const Text('Aceptar'),
  //                       onPressed: () async{
  //                         await FirebaseFirestore.instance.collection('tb_productos').doc(id).delete().then((value) => print("Producto Eliminado Correctamente"));
  //                         Navigator.pop(dialogContext);
  //                       },
  //                       ),
  //                       ],
  //                       );
  //                       },
  //                       );
  // }
}






