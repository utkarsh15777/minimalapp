import 'package:flutter/material.dart';
import 'package:minimalapp/models/product.dart';
import 'package:minimalapp/models/shop.dart';
import 'package:provider/provider.dart';

class MyProductTile extends StatelessWidget {

  final Product product;
  const MyProductTile({super.key, required this.product});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primary,
        borderRadius: BorderRadius.circular(10)
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(25),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,

        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1,
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(25),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.secondary,
                    borderRadius: BorderRadius.circular(12)
                  ),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    product.imagePath
                  )
                ),
              ),

              const SizedBox(
                height: 25,
              ),



              Text(
                product.name,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                ),
              ),

              const SizedBox(
                height: 10,
              ),


              Text(
                product.description,
                style: TextStyle(
                  color: Theme.of(context).colorScheme.inversePrimary
                ),
              ),
            ],
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '\$${product.price.toStringAsFixed(2)}',
              ),
              Container(
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.secondary,
                  borderRadius: BorderRadius.circular(12)
                ),
                child: IconButton(
                  onPressed: () => addToCart(context),
                  icon: const Icon(
                    Icons.add
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
  
  addToCart(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Add to Cart?"),
        actions: [
          MaterialButton(
            onPressed:() => Navigator.pop(context),
            child: const Text(
              "Cancel"
            ),
          ),

          MaterialButton(
            onPressed:() {
              Navigator.pop(context);
              context.read<Shop>().addToCart(product);

              showDialog(
                context: context,
                builder: (context) => AlertDialog(
                  content: const Text("Added to Cart Successfully"),
                  actions: [
                    MaterialButton(
                      onPressed: () => Navigator.pop(context), // Close the dialog
                      child: const Text("OK"),
                    ),
                  ],
                ),
              );
            },
            child: const Text(
              "Yes"
            ),
          )
        ],
      ),
    );
  }
}