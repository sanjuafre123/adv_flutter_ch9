import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/search_model.dart';
import '../provider/search_provider.dart';

TextEditingController txtSearch = TextEditingController();

class SearchScreen extends StatelessWidget {
  const SearchScreen({super.key});

  @override
  Widget build(BuildContext context) {
    SearchProvider homeProvider =
        Provider.of<SearchProvider>(context, listen: false);
    SearchProvider homeProviderTrue =
        Provider.of<SearchProvider>(context, listen: true);
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 65,
        title: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: txtSearch,
                    decoration: InputDecoration(
                      label: const Text('Search Images'),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
                IconButton(
                    onPressed: () {
                      // homeProvider.fromMap(txtSearch.text);
                      homeProvider.searchImg(txtSearch.text);
                    },
                    icon: const Icon(Icons.search)),
              ],
            ),
          ],
        ),
      ),
      body: FutureBuilder(
        future: Provider.of<SearchProvider>(context, listen: false)
            .fromMap(homeProviderTrue.search),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            SearchModal? search = snapshot.data;
            return GridView.builder(
              gridDelegate:
                  const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemCount: search?.hits.length,
              itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.all(10),
                height: 180,
                width: double.infinity,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.cover,
                        image: NetworkImage(
                            '${search?.hits[index].webformatURL}'))),
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
}
