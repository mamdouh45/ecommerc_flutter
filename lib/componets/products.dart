import 'package:flutter/material.dart';
import 'package:flutterapp/pages/product_details.dart';
import 'package:flutterapp/pages/product_details.dart';
import 'package:flutterapp/pages/product_details.dart';

class Products extends StatefulWidget {
  @override
  _ProductsState createState() => _ProductsState();
}

/*
* first we are create Maps of product
* second we create .. class Single_prod extends StatelessWidget ====>
* third we create GridView.builder
*
* */

// first
class _ProductsState extends State<Products> {
  //create Maps of product [{ key : value}]
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
          return Single_prod(
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

// second create Single_prod out of class products StatelessWidget to make single product card to show
class Single_prod extends StatelessWidget {
  final prod_name;
  final prod_pricture;
  final prod_old_price;
  final prod_price;

  // create constructor to pass value to final var
  Single_prod({
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
              onTap: () => Navigator.of(context).push(new MaterialPageRoute(
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
