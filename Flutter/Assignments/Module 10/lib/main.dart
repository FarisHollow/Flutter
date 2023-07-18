import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Orientation Response'),
      ),
      body: OrientationBuilder(
        builder: (context, orientation) {
          return Column(
            children: [
              Container(
                width: double.infinity,
                height: 200.0,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/mountain.jpg'), // Placeholder image
                ),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: (orientation == Orientation.portrait) ? 2 : 4,
                  children: List.generate(10, (index) {
                    return Container(
                      margin: EdgeInsets.symmetric( horizontal: 1),
                      child: Image.asset('assets/mountain.jpg'), // Placeholder image
                    );
                  }),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
