import 'dart:convert';

import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:shopping/model/product.dart';
import 'package:shopping/model/product_response.dart';
import 'package:shopping/widgets/CategoriesWidget.dart';
import 'package:shopping/widgets/HomeAppBar.dart';
import 'package:shopping/widgets/ItemsWidget.dart';
import 'package:http/http.dart' as http;
import 'package:shopping/globals.dart' as globals;

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    getProducts();
    print(products.length);
  }

  List<Product> products = List<Product>.empty();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      // resizeToAvoidBottomPadding: false,
      appBar: AppBar(
        backgroundColor: Colors.amberAccent,
        title: const Text("Products"),
        elevation: 6,
      ),
      body: GridView.builder(
        itemCount: products.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.9,
        ),
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
          return Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 8,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              border: Border.all(color: Colors.grey),
            ),
            padding: const EdgeInsets.all(15),
            alignment: Alignment.center,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                  // onTap: () {
                  //   Navigator.of(context).push(
                  //     MaterialPageRoute(
                  //       builder: (context) => ProductDetails(
                  //         product: products[index],
                  //       ),
                  //     ),
                  //   );
                  // },
                  child: Hero(
                    tag: products[index].prd_thumbnail ?? '',
                    child: Container(
                      height: 170,
                      decoration: BoxDecoration(
                        color: const Color(0xFFD5DCDE),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      alignment: Alignment.center,
                      child: Image.network(
                        products[index].prd_thumbnail ?? '',
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
      bottomNavigationBar: CurvedNavigationBar(
        backgroundColor: Colors.transparent,
        onTap: (index) {},
        height: 70,
        color: const Color(0xFF4C53A5),
        items: const [
          Icon(
            Icons.home,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.shopping_cart_sharp,
            size: 30,
            color: Colors.white,
          ),
          Icon(
            Icons.list,
            size: 30,
            color: Colors.white,
          ),
        ],
      ),
    );
  }

  // getProducts() async {
  //   // print('welcome');
  //   // print('welcome222');
  //   var res = await http
  //       .get(Uri.parse('${globals.ipAddress}/insert/shopping_products.php'));
  //   print(res);
  //   ProductResponse response = ProductResponse.fromJson(jsonDecode(res.body));
  //   print(111);
  //   print(res);
  //   print(222222);

  //   setState(() {
  //     products = response.products ?? [];
  //   });
  // }

  getProducts() async {
    // print('welcome');
    // print('welcome222');
    var res = await http
        .get(Uri.parse('${globals.ipAddress}/insert/shopping_products.php'));
    print(res);
    ProductResponse response = ProductResponse.fromJson(jsonDecode(res.body));
    // print(111);
    // print(res);
    // print(222222);

    setState(() {
      products = response.products ?? [];
    });
  }
}
