import 'package:flutter/material.dart';
import 'package:minimalapp/components/my_drawer.dart';
import 'package:minimalapp/components/my_product_tile.dart';
import 'package:minimalapp/models/shop.dart';
import 'package:provider/provider.dart';

class ShopPage extends StatelessWidget {
  const ShopPage({super.key});

  @override
  Widget build(BuildContext context) {

    final products=context.watch<Shop>().shop;
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "Minimal Shop"
        ),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, '/cart_page'),
            icon: const Icon(
              Icons.shopping_cart_outlined
            ),
          )
        ],
      ),
      drawer: const MyDrawer(
        
      ),
      backgroundColor: Theme.of(context).colorScheme.background,
      body: ListView(
        children: [
          const SizedBox(
            height: 30,
          ),
          Center(
            child: Text(
              "Pick from premium quality products",
              style: TextStyle(
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            )
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: SizedBox(
              height: 550,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: products.length,
                itemBuilder: (context, index) {
                  final product=products[index];
                  return MyProductTile(
                    product: product
                  );
                },
              ),
            ),
          ),
        ],
      )
    );
  }
}