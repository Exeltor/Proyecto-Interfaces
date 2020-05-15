import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:starlite/providers/data.dart';
import 'package:starlite/widgets/card_list_item.dart';

class TermDetailScreen extends StatefulWidget {
  TermDetailScreen(this.plazo);

  final Plazo plazo;

  @override
  _TermDetailScreenState createState() => _TermDetailScreenState();
}

class _TermDetailScreenState extends State<TermDetailScreen> {
  String _title, _lookup;
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    switch (widget.plazo) {
      case Plazo.inmediato:
        _title = 'Plazo Inmediato';
        _lookup = 'inmediato';
        break;
      case Plazo.corto:
        _title = 'Plazo Corto';
        _lookup = 'corto';
        break;
      case Plazo.largo:
        _title = 'Plazo Largo';
        _lookup = 'largo';
        break;
      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    final data = Provider.of<DataProvider>(context);
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        title: Text(
          _title,
          style: const TextStyle(
            color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: (deviceMedia.size.height / 4),
            width: double.infinity,
            child: Column(
              children: [
                const SizedBox(height: 10),
                _getTermCount(data.users[data.currentUser]['metas']),
                _getTermTitle(),
              ],
            ),
          ),
          DraggableScrollableSheet(
            initialChildSize: 0.8,
            minChildSize: 0.8,
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
                separatorBuilder: (context, i) => const SizedBox(height: 20),
                padding:
                    const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
                controller: _scrollController,
                itemCount:
                    data.users[data.currentUser]['metas'][_lookup].length,
                itemBuilder: (context, i) {
                  final product = data.products[data.users[data.currentUser]
                      ['metas'][_lookup][i]];
                  return Dismissible(
                    key: UniqueKey(),
                    direction: DismissDirection.endToStart,
                    onDismissed: (_) => data.deleteGoal(
                        data.users[data.currentUser]['metas'][_lookup][i],
                        _lookup),
                    background: Container(
                      child: Icon(
                        Icons.delete,
                        color: Colors.white,
                      ),
                      alignment: Alignment.centerRight,
                      padding: const EdgeInsets.only(right: 20),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.red,
                      ),
                    ),
                    child: CardListItem(
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

  Text _getTermTitle() {
    switch (widget.plazo) {
      case Plazo.inmediato:
        return Text(
          'Inmediato',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        );
      case Plazo.corto:
        return Text(
          'Corto',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        );
      case Plazo.largo:
        return Text(
          'Largo',
          style: const TextStyle(
            fontSize: 36,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return Text('No type');
    }
  }

  Text _getTermCount(Map userGoals) {
    switch (widget.plazo) {
      case Plazo.inmediato:
        return Text(
          '${userGoals['inmediato'].length}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        );
      case Plazo.corto:
        return Text(
          '${userGoals['corto'].length}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        );
      case Plazo.largo:
        return Text(
          '${userGoals['largo'].length}',
          style: const TextStyle(
            fontSize: 40,
            fontWeight: FontWeight.bold,
          ),
        );
      default:
        return Text('No type');
    }
  }
}
