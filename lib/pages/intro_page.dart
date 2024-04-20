import 'package:flutter/material.dart';
import 'package:minimalapp/components/my_button.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.shopping_bag,
              size: 72,
              color: Theme.of(context).colorScheme.inversePrimary,
              
            ),

            const SizedBox(
              height: 25,
            ),

            //title
            const Text(
              "Minimal Shop",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // SubTitle
            Text(
              "Premium Quality Products",
              style: TextStyle(
                fontSize: 10,
                color: Theme.of(context).colorScheme.inversePrimary
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            MyButton(
              onTap: () => Navigator.pushNamed(context, '/shop_page'),
              child: const Icon(
                Icons.arrow_forward
              ),
            )

          ],
        ),
      ),
    );

   
  }
}