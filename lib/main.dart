import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'input_page.dart';

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        sliderTheme: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbShape: RoundSliderThumbShape(
              enabledThumbRadius: 15,
            ),
            thumbColor: Color(0XFFEB1555),
            overlayColor: Color(0X29EB1555),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 25)),
        primaryColor: Color(0xFF0A0E21),
        scaffoldBackgroundColor: Color(0xFF0A0E21),
        // textTheme: TextTheme(body1: TextStyle(color: Colors.white))
      ),
      home: InputPage(),
    );
  }
}
