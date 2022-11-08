import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class secondpage extends StatefulWidget {
  final double BMI;
  final Text bmitext;
  final Text bmitext1;
  const secondpage({Key? key, required this.BMI, required this.bmitext, required this.bmitext1})
      : super(key: key);

  @override
  State<secondpage> createState() => _secondpageState(BMI, bmitext, bmitext1);
}

class _secondpageState extends State<secondpage> {
  double bmi;
  Text bmitext;
  Text bmitext1;
  _secondpageState(this.bmi, this.bmitext, this.bmitext1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff1e212a),
        appBar: AppBar(title: Text('result')),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(children: [
                Container(
                  height: 300,
                    padding: EdgeInsets.all(40),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(500),
                        color: Colors.white12),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Your BMI is : ${bmi}',
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                        bmitext1,
                        bmitext
                      ],
                    ))
              ]),

              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: StadiumBorder(),
                    padding: EdgeInsets.all(20),
                    backgroundColor: Colors.blue,
                    foregroundColor: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('RECALC'))
            ],
          ),
        ));
  }
}
