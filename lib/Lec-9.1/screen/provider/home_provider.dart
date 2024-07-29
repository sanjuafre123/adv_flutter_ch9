import 'package:api_flutter/Lec-9.1/screen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var recipeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    var recipeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        scrolledUnderElevation: 0.1,
        centerTitle: true,
        leading: const Icon(
          Icons.account_circle_outlined,
          size: 33,
        ),
        title: const Text(
          'Recipe',
          style: TextStyle(color: Colors.blue, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(14.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: TextField(
                            cursorColor: Colors.black,
                            decoration: InputDecoration(
                              fillColor: Color(0xfff6f6f6),
                              prefixIcon: Icon(Icons.search),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(28),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.deepOrange,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Icon(
                              Icons.search,
                              color: Colors.white,
                              size: 25,
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 10, bottom: 10),
                      height: height * 0.20,
                      width: width,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage('assets/bg1.jpeg'),
                        ),
                      ),
                      child: const Padding(
                        padding: EdgeInsets.all(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Start from \$10 per month',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Generate Unlimited\nRecipe!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 25,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Text(
                      'Recipes',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25,
                      ),
                    ),
                    Wrap(
                      spacing: 8,
                      children: [
                        ...List.generate(
                          recipeProviderTrue.recipeModal!.recipes.length,
                          (index) => InkWell(
                            onTap: () {
                              selectedIndex = index;
                              Navigator.of(context).pushNamed('/details');
                            },
                            child: recipeHomeDetails(
                              height: height,
                              width: width,
                              recipeProviderTrue: recipeProviderTrue,
                              index: index,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget recipeHomeDetails({
    required double height,
    required double width,
    required HomeProvider recipeProviderTrue,
    required int index,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.only(bottom: 10, top: 10),
          height: height * 0.17,
          width: width * 0.449,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              fit: BoxFit.cover,
              image: NetworkImage(
                recipeProviderTrue.recipeModal!.recipes[index].image,
              ),
            ),
          ),
        ),
        SizedBox(
          width: width * 0.4,
          child: Text(
            recipeProviderTrue.recipeModal!.recipes[index].name,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 14,
            ),
          ),
        ),
        Text(
          recipeProviderTrue.recipeModal!.recipes[index].tags[1],
          style: const TextStyle(
            fontSize: 14,
          ),
        ),
        Text(
          '${recipeProviderTrue.recipeModal!.recipes[index].reviewCount} Reviews',
          style: const TextStyle(
            fontSize: 16,
          ),
        ),
        SizedBox(
          height: height * 0.01,
        ),
      ],
    );
  }
}

int selectedIndex = 0;
