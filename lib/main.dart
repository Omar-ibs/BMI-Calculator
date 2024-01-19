import 'package:flutter/material.dart';
import 'input_page.dart';

void main() {
  runApp(BMI_calculator());
}

class BMI_calculator extends StatelessWidget {
  const BMI_calculator({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.black,
        ),
        home: Scaffold(
          body: Input_page(),
        ));
  }
}
