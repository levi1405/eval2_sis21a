import 'package:flutter/material.dart';

class InputWidget extends StatefulWidget {
 const InputWidget(
 {
 super.key,
 this.controller,
 this.isPasswordField,
 this.hintText,
 this.labelText,
 //required this.inputType, 
 this.inputType,
 this.icon
 }
);
 //final key? fieldKey;
 final TextEditingController? controller;
 final bool? isPasswordField;
 final String? hintText;
 final String? labelText;
 final TextInputType? inputType;
 final IconData? icon;
 //final Icon? icon;
 @override
 State<InputWidget> createState() => _InputWidgetState();
}
class _InputWidgetState extends State<InputWidget> {
 bool _obscureText = true;
 @override

 Widget build(BuildContext context) {
 return Container(
 width: double.infinity,
 decoration: BoxDecoration(
 color: Colors.grey.withOpacity(.35),
 borderRadius: BorderRadius.circular(10),
 ),
 child: TextFormField(
 style: const TextStyle(color: Colors.black),
 controller: widget.controller,
 keyboardType: widget.inputType,
 obscureText: widget.isPasswordField == true?
_obscureText : false,
 decoration: InputDecoration(
 border: InputBorder.none,
 filled: true,
 hintText: widget.hintText,
 hintStyle: const TextStyle(
 color: Colors.black45
 ),
 suffixIcon: GestureDetector(
 onTap: () {
 setState(() {
 _obscureText = !_obscureText;
 });
 },
 child: widget.isPasswordField==true? Icon(
 _obscureText ? Icons.visibility_off :
Icons.visibility,
 color: _obscureText == false ? Colors.blue 
: Colors.grey,
 ): const Text(""),
 ),
 )
 ),
 );
 }
}