import 'package:flutter/material.dart';



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

class HomeScreen extends StatelessWidget {

  MySnackBar(message,  context){

    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(message)));
  }

  Map<String, String> shop = {
    "\$2" : 'Apple',
    "\$3.5" : 'Chicken',
    "\$8" : 'Beef',
    "\$1": 'Bread',
    "\$20" : 'Burger',
  };


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('My Shopping List',
            // textDirection: TextDirection.ltr,
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w700,
              fontSize: 24,

            ),),
          backgroundColor: Colors.pink,
          centerTitle: true,
          actions: [
            IconButton(onPressed: (){ MySnackBar("Cart is empty", context);}, icon: Icon(Icons.shopping_cart))
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Scrollbar(
                thickness: 10,
                // isAlwaysShown: true,
                // interactive: true,
                child: ListView.separated(
                  itemCount: shop.length,
                  primary: false,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {

                    return ListTile(
                      leading:  Icon(Icons.shopping_bag),
                      title: Text(shop.values.elementAt(index).toString()),
                      subtitle: Text(shop.keys.elementAt(index).toString()),

                    );
                  },
                  separatorBuilder: (context, index) {
                    return Divider(
                      height: 0,
                      color: Colors.red,
                    );
                  },
                ),
              ),

            ],
          ),
        )


    );
  }
}