import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../Home_Screen/homescreen.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeautyProvider beautyProviderFalse = Provider.of<BeautyProvider>(context,listen: false);
    BeautyProvider beautyProviderTrue = Provider.of<BeautyProvider>(context,listen : true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Cart'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            ...List.generate(cartList.length, (index) => Container(
              height: 200,
              width: 400,
              decoration: BoxDecoration(
                  color: Colors.white
              ),
              child: Row(
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(beautyProviderTrue.cart[selectedIndex]['images'][0]),
                        )
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      beautyProviderTrue.cart[index]['title'],
                      beautyProviderTrue.cart[index]['price'],

                    ],
                  )
                ],
              ),
            ),)
          ],
        )
      )
    );
  }
}

List cartList = [];