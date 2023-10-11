import 'package:eval2_sis21a/views/login_page.dart';
import 'package:eval2_sis21a/widget/input_widget.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import'package:eval2_sis21a/user_auth/firebase_auth_services.dart';
import 'package:eval2_sis21a/views/login_page.dart';
import 'package:eval2_sis21a/widget/input_widget.dart';


class SignUpPage extends StatefulWidget {
 const SignUpPage({super.key});
 @override
 State<SignUpPage> createState() => _SignUpPageState();
}
class _SignUpPageState extends State<SignUpPage> {
 final FirebaseAuthService _auth = FirebaseAuthService();
 final TextEditingController _usernameController =
TextEditingController();
 final TextEditingController _emailController =
TextEditingController();
 final TextEditingController _passwordController =
TextEditingController();

 
 @override
 void dispose() {
 _usernameController.dispose();
 _emailController.dispose();
 _passwordController.dispose();
 super.dispose();
 }
 @override
 Widget build(BuildContext context) {
 return Scaffold(
 appBar: AppBar(
 title: const Text("SignUp"),
 ),
 body: Center(
 child: Padding(
 padding: const EdgeInsets.symmetric(horizontal:
15),
 child: SingleChildScrollView(
 child: Column(
 mainAxisAlignment: MainAxisAlignment.center,
 children: [
 const Text(
 "Sign Up",
 style: TextStyle(fontSize: 27, fontWeight:
FontWeight.bold),
 ),
 const SizedBox(
 height: 30,
 ),

 InputWidget(
 controller: _usernameController,
 hintText: "Nombre de Usuario",
 isPasswordField: false,
 ),
 const SizedBox(
 height: 10,
 ),

 InputWidget(
 controller: _emailController,
 hintText: "Dirección de correo",
 isPasswordField: false,
 ),
 const SizedBox(
 height: 10,
 ),
 
 InputWidget(
 controller: _passwordController,
 hintText: "Contrasena",
 isPasswordField: true,
 ),
 const SizedBox(
 height: 30,
 ),
 GestureDetector(
 onTap: _signUp,
 child: Container(
 width: double.infinity,
 height: 45,
 decoration: BoxDecoration(
 color: Colors.blue,
 borderRadius:
BorderRadius.circular(10),
 ),
 child: const Center(
 child: Text(
 "Sign Up",
  style: TextStyle(color:
Colors.white, fontWeight: FontWeight.bold),
 )),
 ),
 ),
 const SizedBox(height: 20,),
 Row(mainAxisAlignment:
MainAxisAlignment.center,
 children: [
 const Text("Ya tienes cuenta?"),
 const SizedBox(width: 5,),
 GestureDetector(
 onTap: () {
 Navigator.pushAndRemoveUntil(
 context,
MaterialPageRoute(builder: (context) => const LoginPage()),
(route) => false);
 },
child: const Text("Login", style:
TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),))
 ],
 )
 ],
 ),
 ),
 ),
 ),
 );
 }
 void _signUp() async { print("hola");
   String username = _usernameController.text;
 String email = _emailController.text;
 String password = _passwordController.text;
 User? user = await _auth.signUpWithEmailAndPassword(email, password);
 if (user != null){
 print("Usuario agregado satisfactoriamente.");
 Navigator.pushReplacement(context,
             MaterialPageRoute(builder:(context)=> LoginPage()) );
 } else{
 print("Some error happend");
 }
 }
}
