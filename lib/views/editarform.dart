import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'Pantalla2.dart';

class EditProductScreen extends StatefulWidget {
  final DocumentSnapshot product;

  EditProductScreen({required this.product});

  @override
  _EditProductScreenState createState() => _EditProductScreenState();
}

class _EditProductScreenState extends State<EditProductScreen> {
  late TextEditingController nameController;
  late TextEditingController priceController;
  late TextEditingController stockController;

  @override
  void initState() {
    super.initState();
    nameController = TextEditingController(text: widget.product['nombre']);
    priceController = TextEditingController(text: widget.product['precio']);
    stockController = TextEditingController(text: widget.product['stock']);
  }

  @override
  void dispose() {
    nameController.dispose();
    priceController.dispose();
    stockController.dispose();
    super.dispose();
  }

  void updateProduct() {
    FirebaseFirestore.instance.collection('tb_productos').doc(widget.product.id).update({
      'nombre': nameController.text,
      'precio': priceController.text,
      'stock': stockController.text,
    });

    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Product'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextFormField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Product Name'),
            ),
            TextFormField(
              controller: priceController,
              decoration: InputDecoration(labelText: 'Product Price'),
            ),
            TextFormField(
              controller: stockController,
              decoration: InputDecoration(labelText: 'Product Stock'),
            ),
            ElevatedButton(
              onPressed: updateProduct,
              child: Text('Update Product'),
            ),
          ],
        ),
      ),
    );
  }
}
