import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/widgets/custom_dialog.dart';

class ProductDetailScreen extends StatelessWidget {
  ProductDetailScreen({
    this.index,
    this.titulo,
    this.descripcion,
    this.imagen,
    this.precio,
  });

  _addGoal(BuildContext context) {
    final userId = Provider.of<DataProvider>(context, listen: false).currentUser;
    Plazo result = Provider.of<DataProvider>(context, listen: false).addGoal(userId, index);
    String term;
    if(result == Plazo.inmediato)
      term = 'Inmediato';
    else if(result == Plazo.corto)
      term = 'Corto';
    else if(result == Plazo.largo)
      term = 'Largo';

    showDialog(
      context: context,
      builder: (context) => CustomDialog(
        title: term != null ? '¡Articulo añadido!' : 'No se ha podido añadir',
        description: term != null ? 'Tu articulo ha sido añadido a la a categoria $term' : 'El articulo ya esta añadido',
        buttonText: 'Salir',
        error: term == null,
      ),
    );
  }

  final String titulo, descripcion, imagen;
  final int precio, index;

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
              AppBarActionButton(
                onPressed: () => _addGoal(context),
                icon: Icons.add,
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
                      Divider(),
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

class AppBarActionButton extends StatelessWidget {
  final Function onPressed;
  final IconData icon;

  const AppBarActionButton({@required this.onPressed, @required this.icon});

  @override
  Widget build(BuildContext context) {
    return Material(
      shape: const CircleBorder(),
      color: Colors.black,
      child: InkWell(
        customBorder: const CircleBorder(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            icon,
            color: Colors.white,
          ),
        ),
        onTap: onPressed,
      ),
    );
  }
}
