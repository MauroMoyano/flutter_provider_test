import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'cart_model.dart'; // Importa el modelo
import 'product.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: 'Provider Example',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.blue),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Provider Example'),
        actions: [
          IconButton(
            icon: Icon(Icons.remove),
            onPressed: () {
              Provider.of<CartModel>(context, listen: false).removeLastItem();
            },
          ),
        ],
      ),
      body: Consumer<CartModel>(
        builder: (context, cart, child) {
          return ListView.builder(
            itemCount: cart.items.length,
            itemBuilder: (context, index) {
              return ListTile(title: Text(cart.items[index]));
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //{item: 'Item ${DateTime.now().toUtc().millisecondsSinceEpoch}'}
          Provider.of<CartModel>(context, listen: false).addItem(
              'Item ${DateTime
                  .now()
                  .toUtc()
                  .millisecondsSinceEpoch}');
        },
        child: Icon(Icons.add),
      ),
    );
  }
}