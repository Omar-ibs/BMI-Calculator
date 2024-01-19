import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';

Input_pageState vars = Input_pageState();
double BMI2 = 0.0;

const textst = TextStyle(
    color: Color.fromARGB(255, 112, 244, 187),
    fontSize: 25.0,
    fontWeight: FontWeight.bold);
const tust =
    TextStyle(color: Color.fromARGB(255, 255, 255, 255), fontSize: 20.0);

class Result_page extends StatefulWidget {
  const Result_page({super.key});
  @override
  State<Result_page> createState() => _Result_pageState();
}

class _Result_pageState extends State<Result_page> {
  /* finally1() {
    setState(() {
      vars.BMI = vars.weight / pow(vars.height / 100, 2);
      BMI1 = vars.BMI;
    });
  }*/

  @override
  Widget build(BuildContext context) {
    double BMI1 = ModalRoute.of(context)!.settings.arguments as double;
    setState(() {
      BMI2 = BMI1;
    });
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 30.0,
              ),
              Text(
                'Your Result',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0),
              ),
              SizedBox(
                height: 30.0,
              ),
              Expanded(
                child: Container(
                  height: 20.0,
                  width: double.infinity,
                  margin: EdgeInsets.only(right: 10.0, left: 10.0),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 61, 61, 60),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 50.0,
                      ),
                      Text(
                        checking(),
                        style: textst,
                      ),
                      SizedBox(
                        height: 80.0,
                      ),
                      Text(
                        BMI2.toStringAsFixed(1),
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 70.0,
                        ),
                      ),
                      SizedBox(
                        height: 70.0,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 40.0),
                        child: Text(
                          displaytexts(),
                          style: tust,
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              GestureDetector(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Color.fromARGB(255, 44, 44, 42),
                    ),
                    height: 70.0,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        'Re-Calculate',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 25.0,
                        ),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}

checking() {
  if (BMI2 < 18.5) {
    return 'Underweight';
  }
  if (BMI2 >= 18.5 && BMI2 <= 24.9) {
    return 'Normal Weight';
  }
  if (BMI2 >= 25 && BMI2 <= 29.9) {
    return 'Overweight';
  }
  if (BMI2 >= 30) {
    return 'Obesity';
  }
}

String displaytexts() {
  if (BMI2 < 18.5) {
    return 'You have a lower than normal body weight. You can eat a bit more.';
  } else {
    if (BMI2 >= 18.5 && BMI2 <= 24.9) {
      return 'You have a normal body weight. Good job!';
    } else {
      if (BMI2 >= 25 && BMI2 <= 29.9) {
        return 'You have a higher than normal body weight. Try to exercise more.';
      } else {
        return 'You are too fat! ,I\'m sorry for that';
      }
    }
  }
}
