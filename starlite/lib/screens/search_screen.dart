import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/screens/product_detail_screen.dart';

class SearchScreen extends StatefulWidget {
  static final routeName = '/search';

  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  List<Map<String, dynamic>> products;

  @override
  void initState() {
    products = Provider.of<DataProvider>(context, listen: false).products;
    super.initState();
  }

  _filterSearch(String searchString) {
    setState(() {
      this.products = Provider.of<DataProvider>(context, listen: false)
          .products
          .where((product) => product["titulo"]
              .toLowerCase()
              .contains(searchString.toLowerCase()))
          .toList();
    });
  }

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
                  onChanged: (value) => _filterSearch(value),
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
              child: ListView.builder(
                itemCount: products.length,
                padding: const EdgeInsets.all(20),
                itemBuilder: (context, i) => ProductItem(
                  currentProduct: products[i],
                  index: i,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProductItem extends StatelessWidget {
  const ProductItem({
    Key key,
    @required this.currentProduct,
    @required this.index,
  }) : super(key: key);

  final Map<String, dynamic> currentProduct;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black54,
                blurRadius: 10,
              ),
            ],
          ),
          child: Material(
            color: Colors.transparent,
            child: InkWell(
              borderRadius: BorderRadius.circular(20),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => ProductDetailScreen(
                    index: index,
                    titulo: currentProduct['titulo'],
                    descripcion: currentProduct['descripcion'],
                    imagen: currentProduct['imagen'],
                    precio: currentProduct['precio'],
                  ),
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Hero(
                  tag: currentProduct['imagen'],
                  child: CachedNetworkImage(
                    imageUrl: currentProduct['imagen'],
                    height: 200,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 5),
        Text(
          currentProduct['titulo'],
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
        ),
        const SizedBox(height: 5),
        Text(
          '€${currentProduct['precio']}',
          style: const TextStyle(fontSize: 18),
        ),
        const SizedBox(height: 15),
      ],
    );
  }
}
