import 'package:flutter/material.dart';
import 'package:minimalapp/components/my_button.dart';
import 'package:minimalapp/models/product.dart';
import 'package:minimalapp/models/shop.dart';
import 'package:provider/provider.dart';


class CartPage extends StatelessWidget {

  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {

    final cart = context.watch<Shop>().cart;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        foregroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text(
          "My Cart"
        ),
      ),
      // drawer: const MyDrawer(
        
      // ),
      body: Column(
        children: [
          Expanded(
            child: cart.isEmpty?
            const Center(child: Text(" Your cart is empty")) :
            ListView.builder(
              itemCount: cart.length,
              itemBuilder: (context, index) {
                final product = cart[index];
          
                return ListTile(
                  title: Text(
                    product.name
                  ),
                  subtitle: Text(
                    product.description
                  ),
                  trailing: IconButton(
                    onPressed: () => removeItemFromCart(context, product),
                    icon: const Icon(
                      Icons.remove
                    ),
                  ),
                );
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.all(50.0),
            child: MyButton(onTap: () => payButtonPressesd(context), child: const Text("Pay Now")),
          )
        ],
      ), 
    );
  }
  
  void removeItemFromCart(BuildContext context,Product product) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: const Text("Remove from Cart?"),
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
              context.read<Shop>().removeFromCart(product);
            },
            child: const Text(
              "Yes"
            ),
          )
        ],
      ),
    );
  }
  
  void payButtonPressesd(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => const AlertDialog(
        content: Text("User wants to pay,connect this app to payment gateway !"),
      ),
    );
  }
}