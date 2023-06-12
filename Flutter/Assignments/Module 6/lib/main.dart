import 'package:flutter/material.dart';

// FAB, ELEVATED, Outline, textbutton, icon button, inkwell, gesture detector

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}

// stless => Enter
// ctl + s => hot reload windows
// cmd + s => hot reload mac

class HomeScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Photo Gallery'),
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.home_outlined),
        ),

        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(16),
              child: Text(
                'Welcome to My Photo Gallery!',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: TextField(
                decoration: InputDecoration(
                  hintText: 'Search photos...',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: [
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Clicked on photo!'),
                      ),
                    );
                  },
                  child: Column(

                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSY8hsrLLTfjtbmPYjQZYHLKWsZRggKFYy_nw&usqp=CAU',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8),
                      Text('Photo 1'),
                    ],
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text('Clicked on photo!'),
                      ),
                    );
                  },

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Image.network(
                        'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRLCDnt2aO3Zjz_11N0wV7s69heggWC4XjlmLkqJoxDj1Y2Qm_IAeEmn91_-pwdvT0MDD4&usqp=CAU',
                        height: 100,
                        fit: BoxFit.contain,
                      ),
                      SizedBox(height: 8),
                      Text('Photo 2'),
                    ],
                  ),
                ),
                // Add more photo buttons here
              ],
            ),
            ListView(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: [
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Photo Title 1'),
                  subtitle: Text('Photo Description 1'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Photo Title 2'),
                  subtitle: Text('Photo Description 2'),
                ),
                ListTile(
                  leading: Icon(Icons.photo),
                  title: Text('Photo Title 3'),
                  subtitle: Text('Photo Description 3'),
                ),
                // Add more list items here
              ],
            ),

            SizedBox(height: 10,),

            IconButton(onPressed: (){
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Photo uploaded Successfully!'),
                ),
              );

            },
                icon: Icon(Icons.check_circle,  size: 32,
              color: Colors.red,))


          ],
        ),
      ),
    );
  }
}