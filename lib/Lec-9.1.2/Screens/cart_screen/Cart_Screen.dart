import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../Home_Screen/homescreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeautyProvider beautyProviderFalse =
        Provider.of<BeautyProvider>(context, listen: false);
    BeautyProvider beautyProviderTrue =
        Provider.of<BeautyProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ...List.generate(
              beautyProviderTrue.cart.length,
              (index) => Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            beautyProviderTrue.cart[index]['images'][0]),
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Text(
                            beautyProviderTrue
                                .beautyModal!.product[selectedIndex].title,
                            style: TextStyle(fontSize: 15),
                          ),
                        ],
                      ),

                      Row(
                        children: [
                          Text(
                            'Rs. ${beautyProviderTrue.beautyModal!.product[selectedIndex].price}'
                                .toString(),
                          ),
                        ],
                      ),
                      GestureDetector(
                        onTap: () {
                          beautyProviderTrue.deleteP(index);
                        },child: Icon(Icons.delete)),
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

List cartList = [];
