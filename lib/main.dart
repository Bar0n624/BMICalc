import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:newtest/bminfo.dart';

void main() {
  runApp(const Myapp());
}

class Myapp extends StatelessWidget {
  const Myapp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Text a = Text('');
  double minweight = 0;
  double maxweight = 0;
  double height = 100;
  String heighttemp = '100';
  String weighttemp = '50';
  double weight = 50;
  double BMI = 0;
  String bmi = 'Your BMI is:';
  String text = '';
  bool flag = true;
  Text bmitexttemp=Text('');
  Text bmitext = Text(
    'You are: ',
    style: TextStyle(fontSize: 30, color: Colors.white),
    textAlign: TextAlign.center,
  );
  Text bmitext1 = Text(
    'You are: ',
    style: TextStyle(fontSize: 30, color: Colors.white),
    textAlign: TextAlign.center,
  );
  final myController = TextEditingController();
  final weightController = TextEditingController();
  @override
  void heightdispose() {
    myController.dispose();
    super.dispose();
  }

  void heightsetValue() {
    heighttemp = myController.text;
  }

  void heightinitState() {
    super.initState();

    // Start listening to changes.
    myController.addListener(heightsetValue);
  }

  void weightdispose() {
    weightController.dispose();
    super.dispose();
  }

  void weightsetValue() {
    weighttemp = weightController.text;
  }

  void weightinitState() {
    super.initState();

    // Start listening to changes.
    weightController.addListener(weightsetValue);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1e212a),
      appBar: AppBar(
          centerTitle: true,
          title: Text(
            'BMI Calculator',
            textAlign: TextAlign.center,
          )),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Column(children: [
              Container(
                  padding: EdgeInsets.all(20),
                  height: 175,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Colors.white12),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text(bmi,
                            style: const TextStyle(
                                fontSize: 30, color: Colors.white)),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              bmitext,
                              Offstage(
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    shape: StadiumBorder(),
                                    padding: EdgeInsets.all(20),
                                    backgroundColor:
                                        Colors.blue, // <-- Button color
                                    foregroundColor: Colors.white,
                                    // <-- Splash color
                                  ),
                                  onPressed: () {
                                    setState((){
                                      HapticFeedback.lightImpact();
                                      bmi = 'Your BMI is : ';
                                      height = 100;
                                      heighttemp = '100';
                                      myController.text = heighttemp;
                                      weight = 50;
                                      weighttemp = '50';
                                      weightController.text = weighttemp;
                                      text = '';
                                      flag = true;
                                      bmitexttemp=bmitext;
                                      bmitext = Text('You are:',
                                          style:
                                          TextStyle(fontSize: 30, color: Colors.white),
                                          textAlign: TextAlign.center);
                                    });

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (BuildContext context) =>
                                                secondpage(
                                                  BMI: BMI,
                                                  bmitext: bmitext1,
                                                  bmitext1: bmitexttemp
                                                )));
                                  },
                                  child: Text('More'),
                                ),
                                offstage: flag,
                              )
                            ]),
                      ]))
            ]),
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(300),
                  color: Colors.white12),
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                      Text('Height (cm):      ',
                          style: const TextStyle(
                              fontSize: 20, color: Colors.white)),
                      SizedBox(
                          height: 50,
                          width: 100,
                          child: TextField(
                              style: TextStyle(color: Colors.white),
                              keyboardType: TextInputType.number,
                              controller: myController,
                              decoration: InputDecoration(
                                  border: OutlineInputBorder(),
                                  hintStyle: TextStyle(color: Colors.white),
                                  hintText: heighttemp),
                              onChanged: (heighttemp) {
                                setState(() {
                                  if ((double.parse(heighttemp) >= 100) &&
                                      (double.parse(heighttemp) <= 220)) {
                                    height = double.parse(heighttemp);
                                  }
                                });
                              }))
                    ]),
                    Slider(
                        value: height,
                        min: 100,
                        max: 220,
                        onChanged: (value) {
                          setState(() {
                            HapticFeedback.lightImpact();
                            height = value.roundToDouble();
                            heighttemp = height.round().toString();
                            myController.text = heighttemp;
                          });
                        }),
                  ]),
            ),
            Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(300),
                      color: Colors.white12),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              backgroundColor: Colors.blue,
                              foregroundColor: Colors.white,
                            ),
                            onPressed: () {
                              setState(() {
                                HapticFeedback.lightImpact();
                                weight -= 0.1;
                                weighttemp =
                                    ((weight * 10).roundToDouble() / 10)
                                        .toString();
                                weightController.text = weighttemp;
                              });
                            },
                            child: Text(
                              '-',
                              textAlign: TextAlign.center,
                              style: const TextStyle(
                                  fontSize: 50, color: Colors.white),
                            )),
                        Text('Weight (Kg): ',
                            style: const TextStyle(
                                fontSize: 20, color: Colors.white)),
                        SizedBox(
                            height: 50,
                            width: 100,
                            child: TextField(
                                style: TextStyle(color: Colors.white),
                                keyboardType: TextInputType.number,
                                controller: weightController,
                                decoration: InputDecoration(
                                    border: OutlineInputBorder(),
                                    hintStyle: TextStyle(color: Colors.white),
                                    hintText: weighttemp),
                                onChanged: (weighttemp) {
                                  setState(() {
                                    if (double.parse(weighttemp) > 0) {
                                      weight = double.parse(weighttemp);
                                    }
                                  });
                                })),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              shape: CircleBorder(),
                              padding: EdgeInsets.all(20),
                              backgroundColor: Colors.blue, // <-- Button color
                              foregroundColor: Colors.white, // <-- Splash color
                            ),
                            onPressed: () {
                              setState(() {
                                HapticFeedback.lightImpact();
                                weight += 0.1;
                                weighttemp =
                                    ((weight * 10).roundToDouble() / 10)
                                        .toString();
                                weightController.text = weighttemp;
                              });
                            },
                            child:
                                Text('+', style: const TextStyle(fontSize: 50)))
                      ]))
            ]),
            Column(children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          HapticFeedback.lightImpact();
                          bmi = 'Your BMI is : ';
                          height = 100;
                          heighttemp = '100';
                          myController.text = heighttemp;
                          weight = 50;
                          weighttemp = '50';
                          weightController.text = weighttemp;
                          text = '';
                          flag = true;
                          bmitext = Text('You are:',
                              style:
                                  TextStyle(fontSize: 30, color: Colors.white),
                              textAlign: TextAlign.center);
                        });
                      },
                      child: Text('RESET',
                          style: const TextStyle(
                              fontSize: 30, fontStyle: FontStyle.normal))),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: StadiumBorder(),
                        padding: EdgeInsets.all(20),
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        setState(() {
                          flag = false;
                          HapticFeedback.lightImpact();
                          BMI = weight * 10000 / (height * height);
                          if (((BMI * 10).round()) / 10 < 18.5) {
                            minweight = (18.5 * height * height) / 10000;
                            text =
                                'You need to gain \n${((minweight - weight) * 10).round() / 10} kg';
                            String text1 = 'You are underweight';
                            bmitext1 = Text(text,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.yellow));
                            bmitext = Text(
                              text1,
                              style:
                                  TextStyle(fontSize: 30, color: Colors.yellow),
                              textAlign: TextAlign.center,
                            );
                          } else if (((BMI * 10).round()) / 10 >= 18.5 &&
                              ((BMI * 10).round()) / 10 < 25) {
                            text = 'Your weight is normal';
                            bmitext1 = Text('All good!',
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green));
                            bmitext = Text(text,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.green));
                          } else if (((BMI * 10).round()) / 10 >= 25 &&
                              ((BMI * 10).round()) / 10 < 30) {
                            maxweight = (25 * height * height) / 10000;
                            text =
                                'You need to lose \n${((weight - maxweight) * 10).round() / 10} kg';
                            String text1 = 'You are overweight';
                            bmitext1 = Text(text,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.yellow));
                            bmitext = Text(text1,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.yellow),
                                textAlign: TextAlign.center);
                          } else {
                            maxweight = (30 * height * height) / 10000;
                            text =
                                'You need to lose \n${((weight - maxweight) * 10).round() / 10} kg';
                            String text1 = 'You are Obese';
                            bmitext1 = Text(text,
                                style: TextStyle(
                                    fontSize: 30, color: Colors.red));
                            bmitext = Text(text1,
                                style:
                                    TextStyle(fontSize: 30, color: Colors.red),
                                textAlign: TextAlign.center);
                          }

                          bmi =
                              'Your BMI is :${BMI = double.parse((BMI * 10.roundToDouble() / 10).toStringAsFixed(1))}';
                        });
                      },
                      child: Text('CALC',
                          style: const TextStyle(
                              fontSize: 30, fontStyle: FontStyle.normal)))
                ],
              )
            ]),
          ],
        ),
      ),
    );
  }
}
