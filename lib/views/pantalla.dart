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


   return Center(
    child: Column(
      children:<Widget>[


       DataTable(
                sortColumnIndex: 2,
                sortAscending: false,
                columns: [
                  DataColumn(label: Text("Nombre")),
                  DataColumn(label: Text("Apellido")),
                  DataColumn(label: Text("Años"), numeric: true),
                ],
                rows: [
                  DataRow(
                    selected: true,
                    cells: [
                    DataCell(Text("Andres"), showEditIcon: true),
                    DataCell(Text("Cruz")),
                    DataCell(Text("28"))
                  ]),
                  DataRow(cells: [
                    DataCell(Text("Ramos")),
                    DataCell(Text("Ayu")),
                    DataCell(Text("999"))
                  ])
                ],
              ),

              body: FutureBuilder(
        
        future: getMensajes(),
        builder: ((context, snapshot){
          if(snapshot.hasData){
            return ListView.builder(
              itemCount: snapshot.data?.length,
              itemBuilder: ((context, index) {
                return Text(snapshot.data?[index]["nombre"]+" - "+
                snapshot.data?[index]["precio"]+" - "+
                snapshot.data?[index]["stock"]
                );
              })
            ); 
          }else{
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        })
      ]
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

  

}