import 'package:flutter/material.dart';

// my imports
import 'package:flutterapp/componets/cart_products.dart';

/*
* first create app bar
*
*
*
* */
class Cart extends StatefulWidget {
  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //  elevation to shadow for app bar
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(
          'مشترياتي',
          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
        ),
        // actions to create IconButton and on Pressed
        actions: <Widget>[
          // first  IconButton search
          new IconButton(
              icon: Icon(
                Icons.search,
                color: Colors.white,
              ),
              onPressed: () {}),
          //  second IconButton shopping_cart
        ],
      ),
      body: Cart_products(),
      bottomNavigationBar: BottomNavigationBar(),
    );
  }
}

class BottomNavigationBar extends StatefulWidget {
  @override
  _BottomNavigationBarState createState() => _BottomNavigationBarState();
}

class _BottomNavigationBarState extends State<BottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Row(
        children: [
          Expanded(
              child: ListTile(
            title: Text("Total:"),
            subtitle: Text("\Egp 230"),
          )),
          Expanded(
              child: MaterialButton(
            onPressed: () {},
            child: Text(
              'check out',
              style: TextStyle(color: Colors.white),
            ),
            color: Colors.red,
          ))
        ],
      ),
    );
  }
}
