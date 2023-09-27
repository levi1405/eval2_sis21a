import 'package:cloud_firestore/cloud_firestore.dart';


 FirebaseFirestore db = FirebaseFirestore.instance;
 
  /**Metodo para consultar toda la informacion de la coleccion tb_students */
  
   Future<List> getStudiantes() async {
     List students = [];
      CollectionReference collectionReference = db.collection('tb_students');
      QuerySnapshot querySnapshot = await collectionReference.get(); 
  /* for (var documento in querySnapshot.docs) { students.add(documento.data()); } */ 
  querySnapshot.docs.forEach((documento)
   { students.add(documento.data()); });
    //print('$students'); 
  return students; }

  Future<void> addProducto(String nombre, String precio, String stock) async {
     await db.collection('tb_productos').add({"nombre" : nombre, "precio" : precio}); }