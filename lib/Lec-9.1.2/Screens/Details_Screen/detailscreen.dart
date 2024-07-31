
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';
import '../Home_Screen/homescreen.dart';
import '../cart_screen/Cart_Screen.dart';


class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    BeautyProvider beautyProviderTrue =
        Provider.of<BeautyProvider>(context, listen: true);
    return Scaffold(
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: height * 0.30,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  image: DecorationImage(
                    image: NetworkImage(
                      beautyProviderTrue.beautyModal
                          ?.product[beautyProviderTrue.selectedIndex].images[0],
                    ),
                  ),
                ),
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(13, 28, 14, 0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).pop();
                        },
                        child: Icon(
                          CupertinoIcons.left_chevron,
                          size: width * 0.07,
                        ),
                      ),
                      Icon(
                        Icons.favorite_border,
                        size: width * 0.07,
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(14, 12, 14, 0),
                child: Row(
                  children: [
                    SizedBox(
                      height: height * 0.10,
                      width: width * 0.700,
                      child: Text(
                        beautyProviderTrue.beautyModal!
                            .product[beautyProviderTrue.selectedIndex].title,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.w500),
                      ),
                    ),
                    Container(
                      height: height * 0.05,
                      width: width * 0.170,
                      alignment: Alignment.topRight,
                      child: Text(
                        '⭐ ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].rating}',
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.grey.shade700),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: height * 0.018,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  '\$ ${beautyProviderTrue.beautyModal!.product[beautyProviderTrue.selectedIndex].price}',
                  style: TextStyle(
                      fontSize: width * 0.06, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.012,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0, right: 14),
                child: Text(
                  beautyProviderTrue.beautyModal!
                      .product[beautyProviderTrue.selectedIndex].description,
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: width * 0.044,
                      fontWeight: FontWeight.w500),
                ),
              ),
              SizedBox(
                height: height * 0.018,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 14.0),
                child: Text(
                  'Rating & reviews',
                  style: TextStyle(
                      fontSize: width * 0.056, fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  'Category: ${beautyProviderTrue.beautyModal!.product[selectedIndex].category}',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  beautyProviderTrue
                      .beautyModal!.product[selectedIndex].description,
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: const Text(
                  'Reviews:',
                  style: TextStyle(
                    fontSize: 20,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  beautyProviderTrue.beautyModal!.product[selectedIndex]
                      .reviews[0].reviewerName,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.grey,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  'Feedback: ${beautyProviderTrue.beautyModal!.product[selectedIndex].reviews[0].comment}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  beautyProviderTrue.beautyModal!.product[selectedIndex]
                      .reviews[1].reviewerName,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  'Feedback: ${beautyProviderTrue.beautyModal!.product[selectedIndex].reviews[1].comment}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.01,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  beautyProviderTrue.beautyModal!.product[selectedIndex]
                      .reviews[2].reviewerName,
                  style: TextStyle(fontSize: 18, color: Colors.grey),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13),
                child: Text(
                  'Feedback: ${beautyProviderTrue.beautyModal!.product[selectedIndex].reviews[2].comment}',
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.grey,
                  ),
                ),
              ),
              SizedBox(
                height: height * 0.010,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              GestureDetector(
                onTap: () {
                  beautyProviderTrue.cartAdd();
                  Navigator.of(context).push(MaterialPageRoute(builder: (context)=> const CartScreen()));
                },
                child: Container(
                  height: height * 0.068,
                  width: width * 0.95,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.circular(30),
                    border: Border.all(color: Colors.black, width: 1),
                  ),
                  alignment: Alignment.center,
                  child: Text(
                    'Add To Cart',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: width * 0.048,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
