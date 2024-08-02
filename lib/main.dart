
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'Lec-9.1.2/Screens/Details_Screen/detailscreen.dart';
import 'Lec-9.1.2/Screens/Home_Screen/homescreen.dart';
import 'Lec-9.1.2/Screens/cart_screen/Cart_Screen.dart';
import 'Lec-9.1.2/provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => BeautyProvider(),
        ),
      ],
      builder: (context, child) => MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => const HomeScreen(),
          '/detail': (context) => const DetailScreen(),
          '/cart': (context) => const CartScreen(),
        },
      ),
    );
  }
}
