import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../provider/provider.dart';

var txtSearch = TextEditingController();

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    BeautyProvider beautyProviderFalse =
        Provider.of<BeautyProvider>(context, listen: false);
    BeautyProvider beautyProviderTrue =
        Provider.of<BeautyProvider>(context, listen: true);

    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: Icon(
              Icons.shopping_cart_outlined,
              size: 30,
              color: Colors.black45,
            ),
          )
        ],
        leading: const Icon(
          Icons.menu,
          size: 30,
        ),
        centerTitle: true,
        title: Text(
          'Product',
          style: TextStyle(
            fontSize: width * 0.06,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
      body: (beautyProviderTrue.beautyModal == null)
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Padding(
              padding: const EdgeInsets.only(left: 14.0, right: 14, top: 14),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            controller: txtSearch,
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: const BorderSide(
                                  color: Colors.black,
                                ),
                                borderRadius: BorderRadius.circular(15),
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(
                            Icons.search,
                            size: width * 0.064,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: height * 0.03,
                    ),
                    Container(
                      height: height * 0.22,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: Colors.blueGrey,
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/bt.jpg'),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: height * 0.016,
                    ),
                    Text(
                      'Categories',
                      style: TextStyle(
                          fontWeight: FontWeight.w500, fontSize: width * 0.05),
                    ),
                    SizedBox(
                      height: height * 0.016,
                    ),
                    Wrap(
                      children: [
                        ...List.generate(
                          10,
                          (index) => Padding(
                            padding: const EdgeInsets.only(bottom: 14,right: 9,left: 2),
                            child: GestureDetector(
                              onTap: () {
                                beautyProviderTrue.selectedIndex = index;
                                Navigator.of(context).pushNamed('/detail');
                              },
                              child: Column(
                                children: [
                                  Container(
                                    margin: EdgeInsets.only(),
                                    height: height * 0.30,
                                    width: width * 0.430,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      border: Border.all(
                                          width: 0.3,
                                          color: Colors.grey.shade400),
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(top: 10),
                                      child: Column(
                                        children: [
                                          Container(
                                            height: height * 0.18,
                                            width: width * 0.35,
                                            decoration: BoxDecoration(
                                              color: const Color(0xffDEDFE1),
                                              borderRadius:
                                                  BorderRadius.circular(12),
                                              image: DecorationImage(
                                                image: NetworkImage(
                                                    beautyProviderTrue
                                                        .beautyModal!
                                                        .product[index]
                                                        .images[0]),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            height: height * 0.008,
                                          ),
                                          Text(
                                            beautyProviderTrue.beautyModal!
                                                .product[index].brand
                                                .toString(),
                                            style: TextStyle(
                                                fontSize: width * 0.042,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          Text(
                                            'Price:- \$${beautyProviderTrue.beautyModal!.product[index].price}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: width * 0.036,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.grey),
                                          ),
                                          Text(
                                            'Rating:- ${beautyProviderTrue.beautyModal!.product[index].rating}',
                                            textAlign: TextAlign.center,
                                            style: TextStyle(
                                                fontSize: width * 0.036,
                                                fontWeight: FontWeight.w400,
                                                color: Colors.black),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}

int selectedIndex = 0;
