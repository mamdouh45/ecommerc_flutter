import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';

import 'package:flutterapp/componets/horizontal_listview.dart';
import 'package:flutterapp/componets/products.dart';
import 'package:flutterapp/pages/cart.dart';
class HomePage extends StatefulWidget {
  /*
  * first Scaffold(appBar
  * second drawer:
  *  third make body new ListView input (image_carousel class (up), )
  * import 'componets/products.dart';
  *
  *
  *  */
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    // we build widget var image_carousel input Container child new Carousel(this new constructor to build image_carousel)
    Widget image_carousel = new Container(
      height: 200.0,
      child:  new Carousel(
        // first box fit cover
        boxFit: BoxFit.cover,
        // second List of images Asset
        images: [
          AssetImage('images/w3.jpeg'),
          AssetImage('images/m1.jpeg'),
          AssetImage('images/c1.jpg'),
          AssetImage('images/w4.jpeg'),
          AssetImage('images/m2.jpg'),
        ],
        autoplay: false,
        // animationCurve: Curves.fastOutSlowIn,
        //   animationDuration: Duration(milliseconds: 1000),
        dotSize: 4.0,
        indicatorBgPadding: 2.0,
      ),
    );

    return Scaffold(
      appBar: new AppBar(
        //  elevation to shadow for app bar
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: Text(
          'ديكوراتنا',
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
          new IconButton(
              icon: Icon(
                Icons.shopping_cart,
                color: Colors.white,
              ),
              onPressed: () {
                //========== this Nav to go Cart page =========================
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => new Cart()));
              })
        ],
      ),

      // make drawer: input child: new ListView
      drawer: new Drawer(
        child: new ListView(
          children: <Widget>[

//         make    header use UserAccountsDrawerHeader basic (accountName,accountEmail,currentAccountPicture)

            new UserAccountsDrawerHeader(
              accountName: Text('Mamdouh ahmed'),
              accountEmail: Text('santosenoque.ss@gmail.com'),
              // [GestureDetector] for handling taps. and make InkWell
              currentAccountPicture: GestureDetector(
                // CircleAvatar to take pic from database or design
                child: new CircleAvatar(
                  // Basic
                  backgroundColor: Colors.grey,
                  child: Icon(Icons.person, color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.deepPurpleAccent
              ),
            ),

//            body of drawer make taps by InkWell class

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Home Page'),
                leading: Icon(Icons.home),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My account'),
                leading: Icon(Icons.person),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('My Orders'),
                leading: Icon(Icons.shopping_basket),
              ),
            ),

            InkWell(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Cart()));
              },
              child: ListTile(
                title: Text('ShoppingCard'),
                leading: Icon(Icons.shopping_cart),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Favourites'),
                leading: Icon(Icons.favorite),
              ),
            ),


            // make Divider() class to Divider line in drawer
            Divider(
                color: Colors.deepPurpleAccent
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings, color: Colors.blue,),
              ),
            ),

            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('About'),
                leading: Icon(Icons.help, color: Colors.green),
              ),
            ),
          ],
        ),
      ),
//**** third make body new ListView input (image_carousel class (up),  (HorizontalList()) class import from components directory
      body: new Column(
        children: <Widget>[
          //image carousel begins here
          image_carousel,

          // after padding widget
          new Padding(padding: const EdgeInsets.all(4.0),
            child: new Text('التصنيفات'),),

          //Horizontal list view begins here
          HorizontalList(),

          //padding widget
          new Padding(padding: const EdgeInsets.all(8.0),
            child: Container(
              alignment: Alignment.centerRight,
              child: new Text('المنتجات الحالية  '),
            ),),

          //grid view
          // child import class Products()
          Flexible(child: Products())
        ],
      ),
    );
  }
}
