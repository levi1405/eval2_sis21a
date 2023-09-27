import 'package:flutter/material.dart';

class Registro extends StatefulWidget{
  const Registro({super.key});

  @override
  State<Registro> createState() => _RegistroState();
}

class _RegistroState extends State<Registro> {

  TextEditingController _dato = TextEditingController();
  //(°F − 32) × 5/9
  double resultado=0.0;
  bool validacion=false;
  String mensaje = '';
  double farenheit=0.0;

  void _conver(){
    setState(() {
      if(_dato.text.toString()==''){
        validacion=true;
       mensaje='Campo Obligatorio';
       resultado=0.0;
       return;
      }
      farenheit= double.parse(_dato.text.toString());
      resultado=(farenheit -32)* 5/9;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.add_chart, size: 90,),
          Text('Coversion F° a C°',
            style: TextStyle(
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: Colors.black,

            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: TextField(
              controller: _dato,
              textAlign: TextAlign.center,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                labelText: 'F°',
                hintText: 'Dijite Temperatura F°',
                errorText: _dato.text.toString() =='' ? mensaje : null
              ),
            ),
          ),
          ElevatedButton(onPressed: (){
            _conver();
          },
              child: Text('Convertir')),
          Text('${resultado.toStringAsFixed(2)}',
          style: TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          color: Colors.black54,
          ),
          ),
        ],
      ),
    );
  }
}