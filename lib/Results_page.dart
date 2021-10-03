import 'package:bmi_calculator/ExtendFile.dart';
import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Constants.dart';

class Results_page extends StatelessWidget {
  final String bmiResult;
  final String resultText;
  final String interpretation;
  Results_page({
    @required this.bmiResult,
    @required this.resultText,
    @required this.interpretation,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              child: Text(
                'Your Result',
                style: textStyle2(),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusbleCode(
              color: activeCardColor,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: textStyle4(),
                  ),
                  Text(
                    bmiResult,
                    style: textStyle5(),
                  ),
                  Text(
                    interpretation,
                    style: textStyle6(),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
          GestureDetector(
            onTap: Feedback.wrapForTap(() {
              Navigator.pop(context);
            }, context),
            child: Container(
              child: Center(
                child: Text(
                  'RE-CALCULATE',
                  style: textStyle3(),
                ),
              ),
              color: pink,
              height: bottomContainerHeight,
              width: double.infinity,
              margin: EdgeInsets.only(top: 15),
            ),
          )
        ],
      ),
    );
  }
}
