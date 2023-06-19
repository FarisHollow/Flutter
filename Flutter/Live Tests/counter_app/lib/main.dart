import 'package:flutter/material.dart';
import 'package:counter_app/screen.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Counter App',
      debugShowCheckedModeBanner: false ,

      home: CounterApp(),
    );
  }
}

class CounterApp extends StatefulWidget {
  @override
  _CounterAppState createState() => _CounterAppState();
}

class _CounterAppState extends State<CounterApp> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
      if (_counter == 5) {
        showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              title: Text('Counter value is 5!'),
              content: Text("More to go"),
              actions: [
                TextButton(
                  child: Text('OK'),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          },
        );
      } else if (_counter == 10) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => SecondScreen(),
          ),
        );
      }
    });
  }

  void _decrementCounter() {
    setState(() {
      _counter--;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter App'),
        backgroundColor: Colors.pink,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children:[
            Text(
              'Counter Value:',
              style: TextStyle(fontSize: 20),
            ),
            Text(
              '$_counter',
              style: TextStyle(fontSize: 40),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [

                Expanded(
                  flex: 2,
                  child: ElevatedButton.icon(
                    onPressed: _incrementCounter,

                    icon: Icon(Icons.add),

                    label: Text('Increment'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.deepPurple),
                  ),
                ),
                Flexible(
                  flex: 1,
                  child: SizedBox(width: 30,),
                ),
                Expanded(
                  flex: 1,
                  child: ElevatedButton.icon(
                    onPressed: _decrementCounter,
                    icon: Icon(Icons.remove),

                    label: Text('Decrement'),
                    style: ElevatedButton.styleFrom(backgroundColor: Colors.red),

                  ),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}


