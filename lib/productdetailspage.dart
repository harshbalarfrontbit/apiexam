import 'package:flutter/material.dart';

class ProductDetailsScreen extends StatefulWidget {
  final dynamic image;
  final dynamic title;
  final dynamic price;
  final dynamic description;
  final dynamic category;

  const ProductDetailsScreen(
      {super.key,
      this.image,
      this.title,
      this.price,
      this.description,
      this.category});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Container(
        decoration: const BoxDecoration(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(20),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 10,
              spreadRadius: 10,
              offset: Offset(0, 4),
            ),
          ],
        ),
        height: 300,
        width: double.infinity,
        child: Hero(
          tag: widget.image,
          child: ClipRRect(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(20),
            ),
            child: Image.network(
              "${widget.image}",
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
