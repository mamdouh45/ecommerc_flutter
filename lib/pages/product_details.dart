import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterapp/main.dart';

import 'home.dart';

/*
* first return Scaffold .. ( appbar)
*second body(..appbar(),ListView..(Container()))
* third
*
*
* */
class ProductDetails extends StatefulWidget {
  /* first to git details from product.dart must be create model var and constructor to git value from product.dar to Product_Details
 * second go to Navigator.of--->ProductDetails()
 * */
  final Product_Details_name;
  final Product_Details_new_price;
  final Product_Details_old_price;
  final Product_Details_picture;

  const ProductDetails(
      {Key key,
      this.Product_Details_name,
      this.Product_Details_new_price,
      this.Product_Details_old_price,
      this.Product_Details_picture})
      : super(key: key);

  @override
  _ProductDetailsState createState() => _ProductDetailsState();
}

class _ProductDetailsState extends State<ProductDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        //  elevation to shadow for app bar
        elevation: 0.1,
        backgroundColor: Colors.red,
        title: InkWell(
          child: Text('المتجر '),
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => new HomePage()));
          },
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

      // ============= second make listView ==================
      /*
      *
      * */
      body: ListView(
        children: [
          Container(
            height: 300.0,
            // her pass value from product in GridTile..(Container())
            child: GridTile(
              //=============begin Container of product pic  ==================
              child: Container(
                color: Colors.white70,
                //  to pass Product_Details_picture this is in parent class ProductDetails to Referring pass widget.Product_Details_picture
                child: Image.asset(widget.Product_Details_picture),
              ),
              //... next
              //=============End Container of product pic  ==================
              //=============begin Footer Container of product  ================== footer of container  is above widget in same container
              footer: new Container(
                color: Colors.white70,
                child: ListTile(
                  // leading The primary content of the list tile. to address left side but title = to mid sid

                  /* leading: Text(
                    widget.Product_Details_name,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16.0,
                    ),
                  ),*/

                  //
                  //=============begin details product above footer ==================
                  // Row -->Expanded(text1),Expanded(text2),Expanded(text3)
                  title: Row(
                    textDirection: TextDirection.rtl,
                    children: [
                      Expanded(
                          child: Text(
                        widget.Product_Details_name,
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16.0),
                      )),
                      Expanded(
                        child: Text(
                          "قبل" +
                              widget.Product_Details_old_price.toString() +
                              "ج.م",
                          style: TextStyle(
                              color: Colors.grey,
                              decoration: TextDecoration.lineThrough),
                        ),
                      ),
                      Expanded(
                        child: Text(
                            "بعد.." +
                                widget.Product_Details_new_price.toString() +
                                "ج.م",
                            style: TextStyle(
                                color: Colors.red,
                                fontSize: 20,
                                fontWeight: FontWeight.bold)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),

          //    ============= the begin the  Buttons ================== Row -->Expanded 1 -->(MaterialButton..onPressed (){ AlertDialog}   btn style begin from color )
          Row(
            children: [
              //============= the Prices ==================
              //============= the quantity ==================
              //============= the begin quantity Dialog ==================
              Expanded(
                  // begin MaterialButton
                  child: MaterialButton(
                onPressed: () {
                  // begin showDialog
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title:
                              Text("الكمية", textDirection: TextDirection.rtl),
                          content: new Text(
                            "اختار الكمية :",
                            style: TextStyle(),
                            textDirection: TextDirection.rtl,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                // ===== this is to close  MaterialButton =========
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        );
                      });
                },
                // ============= the size Button ==================
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(child: Text("الكمية")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),

              //******************* the end  price  ***************

              //============= the Colors ==================
              //============= the begin colors Dialog ==================
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title:
                              Text("الألوان", textDirection: TextDirection.rtl),
                          content: new Text(
                            "اختار اللون :",
                            style: TextStyle(),
                            textDirection: TextDirection.rtl,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                // ===== this is to close  MaterialButton =========
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                // ========
                child: Row(
                  children: [
                    Expanded(child: Text("الألوان")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              )),

              //============= the Size ==================
              //============= the begin size Dialog ==================
              Expanded(
                  child: MaterialButton(
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return new AlertDialog(
                          title: Text("المقاسات",
                              textDirection: TextDirection.rtl),
                          content: new Text(
                            "اختار من المقاسات التالية :",
                            style: TextStyle(),
                            textDirection: TextDirection.rtl,
                          ),
                          actions: [
                            MaterialButton(
                              onPressed: () {
                                // ===== this is to close  MaterialButton =========
                                Navigator.of(context).pop(context);
                              },
                              child: Text(
                                "Close",
                                style: TextStyle(color: Colors.green),
                              ),
                            )
                          ],
                        );
                      });
                },
                color: Colors.white,
                textColor: Colors.grey,
                elevation: 0.2,
                child: Row(
                  children: [
                    Expanded(child: Text("المقاس")),
                    Expanded(child: Icon(Icons.arrow_drop_down))
                  ],
                ),
              ))
            ],
          ),

          //============= the end buttons ==================

          //============= the Buy button ==================
          Row(
            children: [
              Expanded(
                child: MaterialButton(
                  onPressed: () {},
                  child: Text(
                    "اشتر الأن",
                    style:
                    TextStyle(fontWeight: FontWeight.bold, fontSize: 16.0),
                  ),
                  color: Colors.red,
                  textColor: Colors.black,
                  elevation: 0.2,
                ),
              ),
              new IconButton(
                  icon: Icon(Icons.add_shopping_cart, color: Colors.red),
                  onPressed: () {}),
              // new Padding(padding: const EdgeInsets.all(0.2)),
              new IconButton(
                  icon: Icon(Icons.favorite_border, color: Colors.red),
                  onPressed: () {})
            ],
          ),

          //============= the product details ==================
          //============= the begin product details ==================
          Divider(),
          ListTile(
            title: Text(
              "معلومات عن المنتج",
              textDirection: TextDirection.rtl,
            ),
            subtitle: Text(
              "المنتج أو المنتوج هو لفظة عامة تشمل كل ما يصنع أو ينتج بغرض البيع والتسويق والتصدير للأفراد أو الجماعات أو الدول ويشمل ذلك المنتجات الصناعية والزراعية والخدمات. ويكيبيديا",
              textDirection: TextDirection.rtl,
            ),
          ),
          Divider(),
          new Row(
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("اسم المنتج :",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text(widget.Product_Details_name),
              )
            ],
          ),
          new Row(
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("العلامة التجارية :",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("3d house"),
              ),
            ],
          ),
          new Row(
            textDirection: TextDirection.rtl,
            children: [
              Padding(
                padding: const EdgeInsets.fromLTRB(12.0, 5.0, 5.0, 5.0),
                child: Text("حالة المنتج :",
                    textDirection: TextDirection.rtl,
                    style: TextStyle(color: Colors.grey)),
              ),
              Padding(
                padding: EdgeInsets.all(5.0),
                child: Text("جديد"),
              )
            ],
          ),
          Divider(),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              "منتجات متشابهة",
              textDirection: TextDirection.rtl,
              style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(),
          // =================== add Similar_single_prod =============
          Container(
            height: 340.0,
            child: Similer_products(),
          ),
        ],
      ),
    );
  }
}

class Similer_products extends StatefulWidget {
  @override
  _Similer_productsState createState() => _Similer_productsState();
}

class _Similer_productsState extends State<Similer_products> {
  var product_list = [
    {
      "name": "بليزر1",
      "picture": "images/products/blazer1.jpeg",
      "old_price": 120,
      "price": 85,
    },
    {
      "name": "تيشيرت احمر",
      "picture": "images/products/dress1.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "فستان اسود",
      "picture": "images/products/dress2.jpeg",
      "old_price": 100,
      "price": 50,
    },
    {
      "name": "صندل فرنسي",
      "picture": "images/products/hills1.jpeg",
      "old_price": 100,
      "price": 50,
    }
  ];

/////////////////end first block
  @override
  Widget build(BuildContext context) {
    // third we create GridView.builder in Products   StatefulWidget to return single_prod
    return GridView.builder(
      //itemCount product_list.length
        itemCount: product_list.length,
        // عدد تقاطع المحاور
        gridDelegate:
        new SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        //  itemBuilder is function tow (BuildContext context, int index)
        // حيث تقع القطعة داخل التطبيق مثل مكانها في المؤشر وهي وظيفة
        itemBuilder: (BuildContext context, int index) {
          // return constructor  Single_prod
          return Similar_single_prod(
            // we initialize constructor value : key
            // لجعل سعر المنتج يساوي سعر مؤشر قائمة المنتجات
            // اسم المنتج يساوي قيمة مؤسر الأسم في قائمة المنتجات
            prod_name: product_list[index]['name'],
            prod_pricture: product_list[index]['picture'],
            prod_old_price: product_list[index]['old_price'],
            prod_price: product_list[index]['price'],
          );
        });
  }
}

class Similar_single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  // create constructor to pass value to final var
  Similar_single_prod({
    this.prod_name,
    this.prod_pricture,
    this.prod_old_price,
    this.prod_price,
  });

//////// end of second block
  @override
  Widget build(BuildContext context) {
    // her we build design card of single product to show in  GridView
    /*
    * card (child: Hero ..(..child: Material..(child: InkWell..(child: GridTile:..(footer(),child: Image.asset) )  ,)
    *
    * */
    // احنا عملنا كارد من نوع هيرو الماتريل بياخد ضغط كامل بداخله جريد تيل الفوتر بتاعه السفلي كونتنر الليست تيل ليه اسمه اسم المتغير
    return Card(
      // Hero is style of design card image & pass tag her we define tag expended pop image asset
      child: Hero(
          tag: Text("اhero1"),
          child: Material(
            child: InkWell(
              // ()=> علانة اليساوي والأكبر من تعني اننا هنعيد قيمة من الفانكشن
              /* this is rout vs intent in android studio
              * onTap to press from ()=> this Navigator.of(context) push to new  MaterialPageRoute (builder: (context) => new ProductDetails())
              *after send page we make model var and constructor another page Product_Details.dart
              * and initialize final var from Product_Details_name: constructor single_product
              * */
              onTap: () =>
                  Navigator.of(context).push(new MaterialPageRoute(
                    // ProductDetails is class in Product_details.dart
                    /*
               * we passing value of the product to ProductDetails
               * */
                      builder: (context) =>
                      new ProductDetails(
                        Product_Details_name: prod_name,
                        Product_Details_new_price: prod_price,
                        Product_Details_old_price: prod_old_price,
                        Product_Details_picture: prod_pricture,
                      ))),
              child: GridTile(
                  footer: Container(
                    color: Colors.white70,
                    child: ListTile(
                      leading: Text(
                        prod_name,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      title: Text(
                        "\$$prod_price",
                        style: TextStyle(
                            color: Colors.red, fontWeight: FontWeight.w800),
                      ),
                      subtitle: Text(
                        "\$$prod_old_price",
                        style: TextStyle(
                            color: Colors.black54,
                            fontWeight: FontWeight.w800,
                            decoration: TextDecoration.lineThrough),
                      ),
                    ),
                  ),
                  child: Image.asset(
                    prod_pricture,
                    fit: BoxFit.cover,
                  )),
            ),
          )),
    );
  }
}
