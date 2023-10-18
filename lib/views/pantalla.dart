import 'dart:ffi';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';


class Pantalla extends StatefulWidget {
  const Pantalla({super.key, required this.title, required TextStyle style});

 

  final String title;

  @override
  State<Pantalla> createState() => PantallaState();


  
}

class PantallaState extends State<Pantalla> {



  void getEstudiantes() async{
    CollectionReference collectionReference =
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensaje = await collectionReference.get();
    if (mensaje.docs.length !=0) {
      for (var doc in mensaje.docs) {
        print(doc.data());
        //chatsx.add(doc.data());
        
      }
    }
  }

  Future<List> getMensajes() async{
    List chats = [];
    CollectionReference collectionReference=
    FirebaseFirestore.instance.collection("tb_productos");
    QuerySnapshot mensajes = await collectionReference.get();
    if(mensajes.docs.length !=0){
      for(var doc in mensajes.docs){
      print(doc.data());
      chats.add(doc.data());
      }
    }
    return chats;
  }

  @override
  Widget build(BuildContext context) {
 return Scaffold(
      appBar: AppBar(
       
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        
        title: Text(widget.title),
      ),

      

      body: FutureBuilder(

        
        
        future: getMensajes(),
        builder: ((context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {

                return Container(
                  
                  decoration: BoxDecoration(
                border: Border.all(color: Colors.green), // Borde verde
                borderRadius: BorderRadius.circular(10.0), // Bordes redondeados
              ),
              margin: EdgeInsets.all(10),
                  child: 
                      Card(
                   elevation: 0,
                  child: InkWell(
                  
                      child: SizedBox(
                        width: 300,
                        height:100,
                        
                          child: Text(
                            "Nombre: ${snapshot.data?[index]['nombre']}\n"+
                            "Precio: ${snapshot.data?[index]['precio']}\n"+
                            "Stock: ${snapshot.data?[index]['stock']}",
                            
                            
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.blue,

                              
                              
                      ),
                      
                      
                       ),
                        
                   ),
                
                       ),
                      ),
                  
                   
                
                  
                );
                

              }),

        
            );

            




               // return Text(snapshot.data?[index]["nombre"]+" - "+
               // snapshot.data?[index]["precio"]+" - "+
               // snapshot.data?[index]["stock"]
               // );

        
             
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ),

   );
    

    
  }

@override
  void initState() {
    // TODO: implement initState
    super.initState();
    getEstudiantes();
  }

 @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }
  
  void eliminarProducto(data) {
  }

  

}