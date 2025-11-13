import 'package:flutter/material.dart';

enum Product {
  dart(
    'Dart', 
    'Dart is the best object-oriented language for cross-platform development.', 
    'assets/images/ex3/dart.png'
  ),
  
  flutter(
    'Flutter', 
    'Flutter is Google\'s UI toolkit for building natively compiled applications.', 
    'assets/images/ex3/flutter.png' 
  ),
  
  firebase(
    'Firebase', 
    'Firebase is a comprehensive platform for developing mobile and web applications.', 
    'assets/images/ex3/firebase.png' 
  );

  final String title;
  final String description;
  final String imagePath;

  const Product(this.title, this.description, this.imagePath);
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Products', style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),),
        ),
        backgroundColor: Colors.blue,
        
        body: ListView( 
          children: [
            ProductCard(product: Product.dart),
            ProductCard(product: Product.flutter),
            ProductCard(product: Product.firebase),
          ],
        ),
      )
    ),
  );
}

class ProductCard extends StatelessWidget {
  final Product product;
  
  const ProductCard({super.key, required this.product});

  Widget _buildProductContent() {

  return Column(
    mainAxisSize: MainAxisSize.min,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 16.0, 16.0, 8.0),
        child: Image.asset(product.imagePath, height: 80), 
      ),
      Padding(
        padding: const EdgeInsets.only(left: 16.0),
        child: Text(
          product.title, 
          style: const TextStyle(fontSize: 24, color: Colors.blue, fontWeight: FontWeight.bold),
        ),
      ),
      Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 4.0, 16.0, 16.0),
        child: Text(
          product.description, 
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 14, color: Colors.grey),
        ),
      ),
    ],
  );
}

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Padding(
        //margin
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20.0),
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          elevation: 8.0, 
          
          child: _buildProductContent()
        ),
      ),
    );
  }
}