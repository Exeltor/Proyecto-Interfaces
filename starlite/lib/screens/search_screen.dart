import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';

class SearchScreen extends StatelessWidget {
  static final routeName = '/search';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Search',
          style: const TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
        backgroundColor: Colors.transparent,
      ),
      body: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Material(
              borderRadius: BorderRadius.circular(20),
              elevation: 4,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: TextField(
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: InputBorder.none,
                    hintText: 'Tu búsqueda aqui',
                    prefixIcon: Icon(Icons.search),
                  ),
                ),
              ),
            ),
          ),
          FlatButton(
            onPressed: () {},
            child: Text('Añade tu propio articulo'),
          ),
          Expanded(
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black54,
                    blurRadius: 10,
                  ),
                ],
              ),
              child: GridView.builder(
                itemCount: Provider.of<DataProvider>(context, listen: false)
                    .products
                    .length,
                padding: const EdgeInsets.all(20),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 3 / 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                ),
                itemBuilder: (context, i) {
                  final currentProduct =
                      Provider.of<DataProvider>(context, listen: false)
                          .products[i];
                  return Container(
                    child: Image.network(
                      currentProduct['imagen'],
                      fit: BoxFit.cover,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
