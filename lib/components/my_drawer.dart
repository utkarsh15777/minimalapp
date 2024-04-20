import 'package:flutter/material.dart';
import 'package:minimalapp/components/my_list_tile.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            children: [
                  // drawer header logo
              DrawerHeader(
                child: Icon(
                  Icons.shopping_bag,
                  size: 72,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),

              const SizedBox(
                height: 25,
              ),


              // shop tile
              MyListTile(
                text: "Shop",
                icon: Icons.home,
                // onTap: () => Navigator.pushNamed(context,'/shop_page'),
                onTap: () => Navigator.pop(context),
              ),

              MyListTile(
                text: "Cart",
                icon: Icons.shopping_cart,
                onTap: () => Navigator.pushNamed(context,'/cart_page'),
              ),

            ],
          ),

          Padding(
            padding: const EdgeInsets.only(bottom: 25.0),
            child: MyListTile(
              text: "Exit",
              icon: Icons.logout,
              onTap: () => Navigator.pushNamedAndRemoveUntil(context, '/intro_page', (route) => false),
            ),
          )

          // cart tile
          // exit
        ],
      ),
    );
  }
}