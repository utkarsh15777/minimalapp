import 'package:flutter/material.dart';

import 'product.dart';

class Shop extends ChangeNotifier{

  // products for sale
  final List<Product> _shop=[
    Product(
      name: "Product 1",
      price: 99.99,
      description: "Item description..",
      imagePath: 'images/hoodies.jpg'
    ),
    Product(
      name: "Product 2",
      price: 99.99,
      description: "Item description..",
      imagePath: 'images/shoes.jpg'
    ),
    Product(
      name: "Product 3",
      price: 99.99,
      description: "Item description..",
      imagePath: 'images/sunglasses.jpg'
    ),
    Product(
      name: "Product 4",
      price: 99.99,
      description: "Item description..",
      imagePath: 'images/watch.jpg'
    )
  ];
  // user cart
  final List<Product> _cart = [];

  // get products for sale
  List<Product> get shop => _shop;

  // get user cart
  List<Product> get cart => _cart;

  // add item to cart
  void addToCart(Product item){
    _cart.add(item);
    notifyListeners();
  }

  // remove item from cart
  void removeFromCart(Product item){
    _cart.remove(item);
    notifyListeners();
  }

}