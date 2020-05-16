import 'package:cached_network_image/cached_network_image.dart';
import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/screens/product_detail_screen.dart';
import 'package:starlite/widgets/card_list_item.dart';

class ComunidadScreen extends StatefulWidget {
  @override
  _ComunidadScreenState createState() => _ComunidadScreenState();
}

class _ComunidadScreenState extends State<ComunidadScreen> {
  final faker = Faker();
  List<String> _randomPeople = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0; i < 50; i++) {
      _randomPeople.add(faker.person.name());
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    final product =
        Provider.of<DataProvider>(context, listen: false).products[0];
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 50),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: <Widget>[
                const Text(
                  'El objetivo mas popular hoy',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
                Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => ProductDetailScreen(
                          index: 0,
                          descripcion: product['descripcion'],
                          imagen: product['imagen'],
                          precio: product['precio'],
                          titulo: product['titulo'],
                        ),
                      ),
                    ),
                    child: Container(
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
                      height: 200,
                      width: double.infinity,
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: Hero(
                          tag: product['imagen'],
                          child: CachedNetworkImage(
                            imageUrl: product['imagen'],
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
        DraggableScrollableSheet(
          initialChildSize: 0.5,
          minChildSize: 0.5,
          maxChildSize: 1,
          builder: (context, _scrollController) => Container(
            decoration: BoxDecoration(
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
            child: ListView.separated(
              controller: _scrollController,
              separatorBuilder: (context, i) => const SizedBox(height: 20),
              itemCount: _randomPeople.length,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, i) => CardListItem(
                leading: CircleAvatar(
                  radius: 25,
                ),
                title: Text(
                  _randomPeople[i],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '${i + 1} articulos ahorrados',
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: Container(),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
