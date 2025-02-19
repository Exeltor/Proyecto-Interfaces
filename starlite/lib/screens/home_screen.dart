import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/screens/product_detail_screen.dart';
import 'package:starlite/screens/search_screen.dart';
import 'package:starlite/screens/term_detail_screen.dart';
import 'package:starlite/widgets/card_list_item.dart';
import 'package:starlite/widgets/rounded_black_button.dart';

class HomeScreen extends StatelessWidget {
  int _selectNextGoal(Map metas) {
    if (metas['inmediato'].isNotEmpty) return metas['inmediato'][0];
    if (metas['corto'].isNotEmpty) return metas['corto'][0];
    if (metas['largo'].isNotEmpty) return metas['largo'][0];
  }

  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    final data = Provider.of<DataProvider>(context);
    final List joinedItems = [
      ...data.users[data.currentUser]['metas']['inmediato'],
      ...data.users[data.currentUser]['metas']['corto'],
      ...data.users[data.currentUser]['metas']['largo'],
    ];
    return Stack(
      children: <Widget>[
        Container(
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          width: double.infinity,
          child: data.users[data.currentUser]['metas']['inmediato']
                      .isNotEmpty ||
                  data.users[data.currentUser]['metas']['corto'].isNotEmpty ||
                  data.users[data.currentUser]['metas']['largo'].isNotEmpty
              ? Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      const Text(
                        'Tu proxima meta',
                        style: const TextStyle(fontSize: 22),
                      ),
                      Expanded(
                        flex: 2,
                        child: NextGoal(
                          productIndex: _selectNextGoal(
                            data.users[data.currentUser]['metas'],
                          ),
                        ),
                      ),
                      TermsRow(
                        data: data,
                      )
                    ],
                  ),
                )
              : Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      'No tienes ninguna meta aun',
                      style: TextStyle(fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    RoundedBlackButton(
                      child: Text(
                        'Busca articulos',
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      ),
                      onTap: () => Navigator.of(context)
                          .pushNamed(SearchScreen.routeName),
                    ),
                  ],
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
            child: data.users[data.currentUser]['metas']['inmediato']
                        .isNotEmpty ||
                    data.users[data.currentUser]['metas']['corto'].isNotEmpty ||
                    data.users[data.currentUser]['metas']['largo'].isNotEmpty
                ? ListView.separated(
                    controller: _scrollController,
                    separatorBuilder: (context, i) =>
                        const SizedBox(height: 20),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 20),
                    itemCount: joinedItems.length,
                    itemBuilder: (context, i) {
                      final product = data.products[joinedItems[i]];

                      return CardListItem(
                        leading: CircleAvatar(
                          radius: 30,
                          backgroundImage: CachedNetworkImageProvider(
                            product['imagen'],
                          ),
                          backgroundColor: Colors.transparent,
                        ),
                        title: FittedBox(
                          child: Text(
                            product['titulo'],
                            style: const TextStyle(fontSize: 22),
                          ),
                        ),
                        subtitle: Text(
                          '€${product['precio']}',
                          style: const TextStyle(fontSize: 18),
                        ),
                        trailing: Container(),
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) => ProductDetailScreen(
                              descripcion: product['descripcion'],
                              imagen: product['imagen'],
                              precio: product['precio'],
                              titulo: product['titulo'],
                              index: joinedItems[i],
                            ),
                          ),
                        ),
                      );
                    },
                  )
                : Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Vacio',
                          style: const TextStyle(
                              fontSize: 26, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 10),
                        Text(
                          '¡Aqui veras estadisticas interesantes una vez que añadas articulos!',
                          style: const TextStyle(fontSize: 22),
                        ),
                      ],
                    ),
                  ),
          ),
        ),
      ],
    );
  }
}

class TermsRow extends StatelessWidget {
  const TermsRow({
    Key key,
    this.data,
  }) : super(key: key);

  final data;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        TermsCountCategory(
          value: data.users[data.currentUser]['metas']['inmediato'].length,
          name: 'Inmed.',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TermDetailScreen(Plazo.inmediato),
            ),
          ),
        ),
        TermsCountCategory(
          value: data.users[data.currentUser]['metas']['corto'].length,
          name: 'Corto',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TermDetailScreen(Plazo.corto),
            ),
          ),
        ),
        TermsCountCategory(
          value: data.users[data.currentUser]['metas']['largo'].length,
          name: 'Largo',
          onTap: () => Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => TermDetailScreen(Plazo.largo),
            ),
          ),
        ),
      ],
    );
  }
}

class NextGoal extends StatelessWidget {
  NextGoal({@required this.productIndex});

  final int productIndex;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              boxShadow: [
                const BoxShadow(
                  color: Colors.black54,
                  blurRadius: 10,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                Provider.of<DataProvider>(context, listen: false)
                    .products[productIndex]['imagen'],
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.only(left: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  Provider.of<DataProvider>(context, listen: false)
                      .products[productIndex]['titulo'],
                  style: const TextStyle(
                    fontSize: 26,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Text(
                  '€${Provider.of<DataProvider>(context, listen: false).products[productIndex]['precio']}',
                  style: const TextStyle(fontSize: 26),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class TermsCountCategory extends StatelessWidget {
  TermsCountCategory({this.name, this.value, this.onTap});

  final String name;
  final int value;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onTap,
      child: Column(
        children: <Widget>[
          Text(
            '$value',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 50,
            ),
          ),
          Text(
            name,
            style: const TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
