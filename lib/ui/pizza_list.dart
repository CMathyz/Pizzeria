import 'package:flutter/material.dart';
import 'package:pipizerria/ui/pizza_details.dart';
import 'package:pipizerria/ui/share/buy_button_widget.dart';

import '../models/pizza.dart';
import '../models/pizzaData.dart';

class PizzaList extends StatefulWidget {
  const PizzaList({super.key});

  @override
  State<PizzaList> createState() => _PizzaListState();
}

class _PizzaListState extends State<PizzaList> {

  List<Pizza> _pizzas = [];

  @override
  void initState() {
    _pizzas = PizzaData.buildList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Nos Pizzas'),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: _pizzas.length,
        itemBuilder: (context, index){
          return Text(_pizzas[index].title);
        }
      ),
    );
  }

  _buildRow(Pizza pizza) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          bottom: Radius.circular(10.0), top: Radius.circular(2.0)
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => PizzaDetails(pizza),
                ),
              );
            },
            child: _buildPizzaDetails(pizza),
          ),
          BuyButtonWidget()
        ],
      ),
    );
  }

  _buildPizzaDetails(Pizza pizza) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ListTile(
          title: (pizza.title),
          subtitle: (pizza.garniture),
          leading: Icon(Icons.local_pizza),
        ),
        Image.asset(
          'assets/images/pizzas${pizza.image}',
          height: 120,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.fitWidth,
        ),
        Container(
          padding: const EdgeInsets.all(4.0),
          child: Text(pizza.garniture),
        ),
      ],
    );
  }

  _buildBuyButton() {
    return
      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade800)),
            child: Row(
              children: [
                Icon(Icons.shopping_cart),
                SizedBox(width: 5),
                Text("Commander"),
              ],
            ),
            onPressed: () {
              print('Commander une pizza');
            },
          ),
        ],
      );
  }

}
