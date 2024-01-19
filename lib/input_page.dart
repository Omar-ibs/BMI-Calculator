import 'dart:math';

import 'package:flutter/material.dart';
import 'icondata.dart';
import 'reuseablecont.dart';
import 'result_page.dart';

class Input_page extends StatefulWidget {
  @override
  State<Input_page> createState() => Input_pageState();
}

const activecardcolor = Color.fromARGB(255, 48, 46, 44);
const inactivecardcolor = Color.fromARGB(255, 61, 61, 60);

enum Gender {
  male,
  female,
  mm,
}

class Input_pageState extends State<Input_page> {
  int height = 170;
  int weight = 60;
  int age = 20;
  double bmi = 0.0;

  Gender selectedGender = Gender.mm;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    child: reuseablecont(
                      colour: selectedGender == Gender.male
                          ? inactivecardcolor
                          : activecardcolor,
                      cardchild: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icondata(
                            const Icon(
                              Icons.male,
                              size: 80.0,
                              color: Colors.white,
                            ),
                            'MALE'),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedGender = Gender.female;
                      });
                    },
                    child: reuseablecont(
                      colour: selectedGender == Gender.female
                          ? inactivecardcolor
                          : activecardcolor,
                      cardchild: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Icondata(
                            Icon(
                              Icons.female,
                              size: 80.0,
                              color: Colors.white,
                            ),
                            'FEMALE'),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: reuseablecont(
                colour: inactivecardcolor,
                cardchild: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'HEIGHT',
                        style: TextStyle(color: Colors.grey, fontSize: 15.0),
                      ),
                      SizedBox(
                        height: 20.0,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.baseline,
                        mainAxisAlignment: MainAxisAlignment.center,
                        textBaseline: TextBaseline.alphabetic,
                        children: [
                          Text(
                            height.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            'cm',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20.0,
                            ),
                          )
                        ],
                      ),
                      Slider(
                        value: height.toDouble(),
                        min: 50.0,
                        max: 300.0,
                        onChanged: (double newvalue) {
                          setState(() {
                            height = newvalue.toInt();
                          });
                        },
                        activeColor: Colors.white,
                        inactiveColor: Colors.grey,
                      )
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: reuseablecont(
                      colour: inactivecardcolor,
                      cardchild: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'WEIGHT KG',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 15.0),
                            ),
                            SizedBox(
                              height: 13.0,
                            ),
                            Text(
                              weight.toString(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 40.0,
                                  fontWeight: FontWeight.bold),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Roundiconbutton(
                                  onPressed: () {
                                    setState(() {
                                      weight--;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.remove,
                                    weight: 40.0,
                                  ),
                                ),
                                SizedBox(
                                  width: 20.0,
                                ),
                                Roundiconbutton(
                                  onPressed: () {
                                    setState(() {
                                      weight++;
                                    });
                                  },
                                  icon: Icon(
                                    Icons.add,
                                    weight: 40.0,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: reuseablecont(
                      colour: inactivecardcolor,
                      cardchild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'AGE',
                            style:
                                TextStyle(color: Colors.grey, fontSize: 15.0),
                          ),
                          SizedBox(
                            height: 13.0,
                          ),
                          Text(
                            age.toString(),
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 40.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Roundiconbutton(
                                onPressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: Icon(
                                  Icons.remove,
                                  weight: 40.0,
                                ),
                              ),
                              SizedBox(
                                width: 20.0,
                              ),
                              Roundiconbutton(
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                },
                                icon: Icon(
                                  Icons.add,
                                  weight: 40.0,
                                ),
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                setState(() {
                  bmi = weight / pow(height / 100, 2);
                });
                Navigator.push<dynamic>(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Result_page(),
                      settings: RouteSettings(
                        arguments: bmi,
                      )),
                );
              },
              child: Container(
                height: 50.0,
                width: double.infinity,
                color: inactivecardcolor,
                child: Center(
                  child: Text(
                    'Calculate  BMI',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Roundiconbutton extends StatelessWidget {
  Roundiconbutton({required this.onPressed, required this.icon});
  final onPressed;
  final Icon icon;
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      constraints: BoxConstraints(
        minWidth: 40.0,
        minHeight: 40.0,
        maxHeight: 56.0,
        maxWidth: 56.0,
      ),
      onPressed: onPressed,
      fillColor: Colors.white,
      elevation: 2.0,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
      child: icon,
    );
  }
}
