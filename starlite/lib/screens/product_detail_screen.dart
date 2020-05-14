import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({
    this.titulo,
    this.descripcion,
    this.imagen,
    this.precio,
  });

  final String titulo, descripcion, imagen;
  final int precio;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: <Widget>[
          SliverAppBar(
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
              FavoriteButton(),
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
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.black,
      child: InkWell(
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(Icons.favorite),
        ),
        onTap: () {},
      ),
    );
  }
}
