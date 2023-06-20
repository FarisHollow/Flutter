import 'package:flutter/material.dart';
import 'package:module_7/cart_page.dart';



void main() {
  runApp(MyApp(
    appName: 'Shopping App',
  ));
}

class MyApp extends StatelessWidget {

  final String appName;

  const MyApp({required this.appName});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: appName,
        debugShowCheckedModeBanner: false,
        home: HomeScreen()
    );
  }
}

class HomeScreen extends StatefulWidget {

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  void _goToCartPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Cart_Page(totalProducts: itemCounts.values.reduce((a, b) => a + b)),
      ),
    );
  }
  Map<String, String> shop = {
    "\$2": 'Apple',
    "\$3.5": 'Chicken',
    "\$8": 'Beef',
    "\$1": 'Bread',
    "\$33": 'Jeans',
    "\$1": 'Onion',
    "\$0.50": 'Potato',
    "\$2": 'Chips',
    "\$12": 'Turkey',
    "\$9": 'Scissor',
    "\$3": 'Sugar',
    "\$6": 'Olive Oil',
    "\$4": 'Cheese',
    "\$40": 'Tshirt',
  };

  Map<String, int> itemCounts = {}; // Counter for each item

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          'Product List',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontSize: 24,
          ),
        ),
        backgroundColor: Colors.pink,
        centerTitle: true,
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListView.separated(
              itemCount: shop.length,
              primary: false,
              shrinkWrap: true,
              itemBuilder: (context, index) {
                final product = shop.keys.elementAt(index);
                final productName = shop.values.elementAt(index);

                return Column(
                  children: [
                    ListTile(
                      leading: Icon(Icons.shopping_bag),
                      title: Text(productName),
                      subtitle: Text(product),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            itemCounts[product]?.toString() ?? '0',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 8),
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                itemCounts.update(product, (value) => value + 1,
                                    ifAbsent: () => 1);
                              });

                              if (itemCounts[product] == 5) {
                                showDialog(
                                  context: context,
                                  builder: (context) => AlertDialog(
                                    title: Text('Congratulations!'),
                                    content: Text(
                                        'You\'ve bought 5 $productName!'),
                                    actions: [
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                        child: Text('OK'),
                                      ),
                                    ],
                                  ),
                                );
                              }
                            },
                            child: Text('Buy Now'),
                          ),
                        ],
                      ),
                    ),
                  ],
                );
              },
              separatorBuilder: (context, index) {
                return Divider(
                  height: 0,
                  color: Colors.red,
                );
              },
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _goToCartPage,

        child: Icon(Icons.shopping_cart),
        backgroundColor: Colors.pink,
      ),
    );
  }
}
