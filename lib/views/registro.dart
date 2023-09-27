import 'package:eval2_sis21a/models/crud.dart';
import 'package:flutter/material.dart';

class Registro extends StatefulWidget{
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  final TextEditingController _nombreControllers = TextEditingController(text: "");
   final TextEditingController _precioControllers = TextEditingController(text: "");
   final TextEditingController _stockControllers = TextEditingController(text: "");
  
  bool validacion=false;
  String mensaje = '';

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Datos del Producto',
           style: TextStyle(
             fontSize: 30, 
             color: Colors.black,
              fontWeight: FontWeight.bold 
              ), 
              ),
           const SizedBox(height: 20,),
          TextField( controller: _nombreControllers,
           keyboardType: TextInputType.text,
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Digite nombre del producto',
          prefixIcon: Icon(Icons.add_shopping_cart_sharp,
          color: Colors.red,)
                   ),
                  ),
          const SizedBox(height: 20,),
          TextField( controller: _precioControllers,
          keyboardType: TextInputType.text,
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Digite Precio',
          prefixIcon: Icon(Icons.monetization_on_outlined,
         color: Colors.red,)
         ),
         ),
          const SizedBox(height: 20,),
          TextField( controller: _stockControllers,
          keyboardType: TextInputType.number,
          decoration: const InputDecoration(
          border: OutlineInputBorder(),
          hintText: 'Digite el Stock',
          prefixIcon: Icon(Icons.widgets_outlined,
         color: Colors.red,)
         ),
         ),
         const SizedBox(height: 20,),
         ElevatedButton(
        onPressed: () async{
          print('Nombre Producto: ' + _nombreControllers.text);
          print('Precio: ' + _precioControllers.text);
          print('Stock: ' + _stockControllers.text);
          //--------------------------------------------
          //--------------------------------------------
          await addProducto(_nombreControllers.text,
          _precioControllers.text,
          _stockControllers.text).then((_) {
          Navigator.pop(context);
          });
          }, 
          child: const Text('Guardar'))
        ],
      ),
    );
  }
}