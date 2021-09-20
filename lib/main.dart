import 'package:flutter/material.dart';

void main() => runApp(Eshop());

class Eshop extends StatefulWidget {
  @override
  State<Eshop> createState() => _EshopState();
}

class _EshopState extends State<Eshop> {
  var count = 0;
    final  jokes = [
    '"Learn programming to understand programming jokes."',
    '"Code never lies,comments sometimes do."',
    '"You are semicolons to my Statements"',
    '"Programming is 1% writing code and 99% understanding why its not working"',
    '"I told him I cound not open jar. He told me to download java"',
    '"Comparing java and javascript is same as comparing car and carpet"',
    '"Golden rule of programming - If it works dont touch it."'
  ];
  void getAotherJoke() {

    setState(() {
      if (count == jokes.length - 1) {
        count = 0;
      } else {
        count = count + 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text(
            'JOKE APP',
            style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          backgroundColor: Colors.green,
          foregroundColor: Colors.black54,
        ),
        body: Center(
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            padding: const EdgeInsets.all(20),
            decoration: const BoxDecoration(
                border:  Border(
              top:  BorderSide(width: 1.0, color: Colors.black54),
              bottom: BorderSide(width: 1.0, color: Colors.black54),
            ),
            gradient: LinearGradient(colors: [Colors.yellow,Colors.green])
            ),
            child: Text(
              jokes[count],
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontStyle: FontStyle.italic),
                  textAlign: TextAlign.center,
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: getAotherJoke,
          backgroundColor: Colors.green,
          child: const Icon(
            Icons.refresh_rounded,
            size: 30,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
