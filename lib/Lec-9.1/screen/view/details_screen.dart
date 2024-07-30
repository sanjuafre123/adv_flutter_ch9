import 'package:api_flutter/Lec-9.1/screen/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/details_provider.dart';
import 'home_screen.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    var recipeProviderFalse = Provider.of<HomeProvider>(context, listen: false);
    var recipeProviderTrue = Provider.of<HomeProvider>(context, listen: true);
    var detailRecipeProviderFalse =
        Provider.of<DetailRecipeProvider>(context, listen: false);
    var detailRecipeProviderTrue =
        Provider.of<DetailRecipeProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Recipe Details',
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w600),
        ),
      ),
      body: FutureBuilder(
        future: recipeProviderFalse.fromApi(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                  height: height * 0.32,
                  width: width,
                  child: Image.network(
                    recipeProviderTrue
                        .recipeModal!.recipes[selectedIndex].image,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    width: width,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(10),
                        topLeft: Radius.circular(10),
                      ),
                    ),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: height * 0.01,
                        ),
                        Text(
                          recipeProviderTrue
                              .recipeModal!.recipes[selectedIndex].name,
                          style: const TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w800,
                          ),
                        ),
                        SizedBox(
                          height: height * 0.03,
                        ),
                        Row(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                border:
                                    (detailRecipeProviderTrue.selectedPage == 0)
                                        ? const Border(
                                            bottom: BorderSide(
                                              width: 3,
                                              color: Colors.amber,
                                            ),
                                          )
                                        : null,
                              ),
                              child: const Text(
                                'Ingredients',
                                style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ...List.generate(
                          recipeProviderTrue
                              .recipeModal!
                              .recipes[detailRecipeProviderTrue.selectedPage]
                              .instructions
                              .length,
                          (index) => Row(
                            children: [
                              Container(
                                height: 40,
                                width: 16,
                                decoration: BoxDecoration(
                                  color: Colors.deepOrange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              SizedBox(
                                height: 15,
                                child: Text(
                                  '   ${recipeProviderTrue.recipeModal!.recipes[detailRecipeProviderTrue.selectedPage].ingredients[index]}',
                                  maxLines: 1,
                                  overflow: TextOverflow.clip,
                                  style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
