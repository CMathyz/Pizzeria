import 'dart:js';

import 'package:flutter/material.dart';
import 'package:pipizerria/models/menu.dart';
import 'package:pipizerria/ui/pizza_list.dart';
import 'package:pipizerria/ui/share/appbar_widget.dart';

import 'models/cart.dart';
import 'models/pizza.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizzéria',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Notre pizzéria'),
    );
  }
}

class MyHomePage extends StatelessWidget {
  String title;
  Cart _cart;

  MyHomePage({required this.title, Key? key}) :
        _cart = Cart(),
        super(key: key);

  var _menus = [
    Menu(1, 'Entrées', 'entree.png', Colors.lightGreen),
    Menu(2, 'Pizzas', 'pizza.png', Colors.redAccent),
    Menu(3, 'Desserts', 'dessert.png', Colors.brown),
    Menu(4, 'Boissons', 'boisson.png', Colors.lightBlue),
  ];

  var _pizzas = [
    Pizza(1, "Margherita", "Tomato, mozzarella, basil", "pizza-bbq.jpg", 8.99),
    Pizza(2, "Pepperoni", "Pepperoni, mozzarella, tomato sauce", "pizza-merguez.png", 10.99),
    Pizza(3, "Vegetarian", "Mixed vegetables, mozzarella, tomato sauce", "pizza-vegetable.jpg", 9.99),
    Pizza(4, "Hawaiian", "Ham, pineapple, mozzarella, tomato sauce", "pizza-hawai.jpg", 11.99),
  ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBarWidget(title),
        body: ListView.builder(
            padding: const EdgeInsets.all(8.0),
            itemCount: _pizzas.length,
            itemBuilder: (context, index) {
              return _buildRow(context, _pizzas[index]);
            }));
  }
}

_buildRow(BuildContext context, Pizza pizza) {
  return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10.0), top:Radius.circular(2.0)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(pizza.title),
            leading: Icon(Icons.local_pizza),
          ),
          Container(
            padding: const EdgeInsets.all(4.0),
            child: Text(pizza.garniture),
          ),
          Image.asset(
            'assets/images/pizzas/${pizza.image}',
            height: 120,
            width: MediaQuery.of(context).size.width,
            fit: BoxFit.fitWidth,
          ),
          Text(pizza.garniture),
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
                    Text("Commnder")
                  ],
                ),
                onPressed: (){
                  print('Commnder une pizza');
                },
              )
            ],
          )
        ],
      ));
}
