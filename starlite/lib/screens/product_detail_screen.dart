import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({
    this.index,
    this.titulo,
    this.descripcion,
    this.imagen,
    this.precio,
  });

  final String titulo, descripcion, imagen;
  final int precio, index;

  @override
  Widget build(BuildContext context) {
    print('building');
    final userId =
        Provider.of<DataProvider>(context, listen: false).currentUser;
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          Selector<DataProvider, List>(
            selector: (context, dataProvider) =>
                dataProvider.users[userId]['metas'],
            builder: (context, data, child) => SliverAppBar(
              expandedHeight: 400,
              leading: MaterialButton(
                elevation: 0,
                onPressed: () => Navigator.of(context).pop(),
                color: Colors.black,
                child: Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                ),
                shape: CircleBorder(),
              ),
              actions: <Widget>[
                FavoriteButton(
                  index: index,
                  isFavorite: data.contains(index),
                ),
              ],
              flexibleSpace: FlexibleSpaceBar(
                background: Hero(
                  tag: imagen,
                  child: CachedNetworkImage(
                    imageUrl: imagen,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: <Widget>[
                          Flexible(
                            flex: 3,
                            fit: FlexFit.tight,
                            child: Text(
                              titulo,
                              style: const TextStyle(
                                fontSize: 36,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          Text(
                            '€$precio',
                            style: const TextStyle(
                              fontSize: 36,
                            ),
                          )
                        ],
                      ),
                      const SizedBox(height: 10),
                      Text(
                        '# Personas estan ahorrando para este articulo',
                        style: const TextStyle(fontSize: 16),
                      ),
                      const SizedBox(height: 10),
                      const Text(
                        'Descripción',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text(
                        descripcion,
                        style: const TextStyle(fontSize: 18),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FavoriteButton extends StatelessWidget {
  const FavoriteButton({
    Key key,
    @required this.isFavorite,
    @required this.index,
  }) : super(key: key);

  final bool isFavorite;
  final int index;

  @override
  Widget build(BuildContext context) {
    final userId =
        Provider.of<DataProvider>(context, listen: false).currentUser;
    return Material(
      shape: const CircleBorder(),
      color: Colors.black,
      child: InkWell(
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            isFavorite ? Icons.favorite : Icons.favorite_border,
          ),
        ),
        onTap: isFavorite
            ? Provider.of<DataProvider>(context, listen: false)
                .removeFavorites(userId, index)
            : Provider.of<DataProvider>(context, listen: false)
                .addToFavorites(userId, index),
      ),
    );
  }
}
