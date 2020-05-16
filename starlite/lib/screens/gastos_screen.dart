import 'package:faker/faker.dart';
import 'package:flutter/material.dart';
import 'package:starlite/widgets/card_list_item.dart';
import 'package:starlite/widgets/chart.dart';

class GastosScreen extends StatefulWidget {
  @override
  _GastosScreenState createState() => _GastosScreenState();
}

class _GastosScreenState extends State<GastosScreen> {
  final faker = Faker();
  List<Map<String, dynamic>> _dishList = [];

  @override
  void initState() {
    super.initState();
    for(int i = 0; i < 50; i++) {
      _dishList.add({'name': faker.food.dish(), 'amount': faker.randomGenerator.decimal() * 100});
    }
  }

  @override
  Widget build(BuildContext context) {
    final deviceMedia = MediaQuery.of(context);
    return Stack(
      children: <Widget>[
        Container(
          width: double.infinity,
          height: (deviceMedia.size.height / 2) -
              Scaffold.of(context).appBarMaxHeight,
          child: Center(
            child: Chart(),
          ),
        ),
        DraggableScrollableSheet(
          minChildSize: 0.5,
          maxChildSize: 1,
          initialChildSize: 0.5,
          builder: (context, _scrollController) => Container(
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
            child: ListView.separated(
              controller: _scrollController,
              separatorBuilder: (context, i) => const SizedBox(height: 20),
              itemCount: _dishList.length,
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
              itemBuilder: (context, i) => CardListItem(
                leading: CircleAvatar(
                  radius: 25,
                ),
                title: Text(
                  _dishList[i]['name'],
                  style: const TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                subtitle: Text(
                  '€${_dishList[i]['amount'].toStringAsFixed(2)}',
                  style: const TextStyle(fontSize: 20),
                ),
                trailing: Text('10:36', style: const TextStyle(fontSize: 18)),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
