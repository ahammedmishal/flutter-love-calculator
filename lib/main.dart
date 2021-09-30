import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'dart:async';

void main() => runApp(Eshop());

class Eshop extends StatefulWidget {
  @override
  State<Eshop> createState() => _EshopState();
}

class _EshopState extends State<Eshop> {
  final yourName = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final partnersName = TextEditingController();

  int? lovepercentage;
  var loading = false;
 

  void calculateLove() {
    if (formKey.currentState!.validate()) {
      setState(() {
        loading = true;
        lovepercentage = null;
      });
      Timer(const Duration(seconds: 3), () {
        setState(() {
          loading = false;
          lovepercentage = (Random().nextInt(100));
        });
      });
    }
  }

  String? validate(text) {
    if (text!.isEmpty) return 'please add this filed';
  }

  InputDecoration myInputDecorator(text) {
    return InputDecoration(
        hintText: text,
        contentPadding: const EdgeInsets.all(20.0));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme:ThemeData(primarySwatch:Colors.pink,
      textTheme: TextTheme(bodyText2: TextStyle(fontSize: 30,color: Colors.red))),
      home: Scaffold(
          appBar: AppBar(
            title:  Row(children: const[
              Text(
              'LOVE CALCULATOR',
              style:  TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 5,),
            Icon(Icons.favorite_outlined,color: Colors.white,),
            ],mainAxisAlignment: MainAxisAlignment.center,),
            centerTitle: true,
           
            foregroundColor: Colors.black54,
            
          ),
          body: Form(
            key: formKey,
            child: Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    controller: yourName,
                    validator: (text) => validate(text),
                    decoration: myInputDecorator('your name')),
                const SizedBox(
                  height: 30,
                ),
                TextFormField(
                    validator: (text) => validate(text),
                    controller: partnersName,
                    decoration: myInputDecorator('partners name')),
                const SizedBox(
                  height: 30,
                ),
                ElevatedButton.icon(
                    onPressed: calculateLove,
                    icon: const Icon(
                      Icons.favorite_outlined,
                    ),
                    label: const Text(
                      'Calculate Love',
                      style: TextStyle(fontSize: 25),
                    ),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 15),
                    )),
                const SizedBox(
                  height: 20,
                ),
                if (loading)
                  const CircularProgressIndicator(
                    valueColor: AlwaysStoppedAnimation(Colors.pink),
                  ),
                if (lovepercentage != null)
                  Text(
                    '${yourName.text} loves ${partnersName.text} $lovepercentage %',
                  
                  ),
           
              ],
            ),
          )),
      debugShowCheckedModeBanner: false,
    );
  }
}
