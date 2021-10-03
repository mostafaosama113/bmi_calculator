import 'package:bmi_calculator/Results_page.dart';
import 'package:bmi_calculator/customBtn.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ExtendFile.dart';
import 'Constants.dart';
import 'calculator_brain.dart';

const bottomContainerHeight = 70.0;
const activeCardColor = Color(0xFF1D1E33);
const pink = Color(0xFFEB1555);
const fontColor = Color(0xFF8D8E98);
const inactiveCardColor = Color(0xFF111328);

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = inactiveCardColor;
  Color FemaleCardColour = activeCardColor;
  Color maleLogo = Colors.blue;
  Color malefont = Colors.blue;
  Color femaleLogo = Colors.white;
  Color femalefont = Colors.white;
  int height = 180;
  int WEIGHT = 60;
  int age = 21;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('BMI CALCULATOR'),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusbleCode(
                        onClick: () {
                          setState(() {
                            maleCardColour = inactiveCardColor;
                            FemaleCardColour = activeCardColor;
                            maleLogo = Colors.blue;
                            femaleLogo = Colors.white;
                            malefont = Colors.blue;
                            femalefont = Colors.white;
                          });
                        },
                        FeedBack: true,
                        color: maleCardColour,
                        child: getMaleFemale(
                          FontColor: malefont,
                          icon: FontAwesomeIcons.mars,
                          text: 'MALE',
                          logoColor: maleLogo,
                        )),
                  ),
                  Expanded(
                      child: ReusbleCode(
                          FeedBack: true,
                          onClick: () {
                            setState(() {
                              maleCardColour = activeCardColor;
                              FemaleCardColour = inactiveCardColor;
                              maleLogo = Colors.white;
                              femaleLogo = Colors.blue;
                              malefont = Colors.white;
                              femalefont = Colors.blue;
                            });
                          },
                          color: FemaleCardColour,
                          child: getMaleFemale(
                            icon: FontAwesomeIcons.venus,
                            FontColor: femalefont,
                            text: 'FEMALE',
                            logoColor: femaleLogo,
                          ))),
                ],
              ),
            ),
            Expanded(
              child: ReusbleCode(
                color: activeCardColor,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: textStyle(Colors.white),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(
                          height.toString(),
                          style: textStyle2(),
                        ),
                        Text(' cm', style: textStyle(Colors.white)),
                      ],
                    ),
                    Slider(
                      value: height.toDouble(),
                      min: 120.0,
                      max: 220.0,
                      //activeColor: Colors.white,
                      inactiveColor: Color(0xFF8D8E98),
                      onChanged: (double value) {
                        setState(() {
                          height = value.toInt();
                        });
                      },
                    )
                  ],
                ),
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  Expanded(
                    child: ReusbleCode(
                      color: activeCardColor,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: textStyle(Colors.white),
                          ),
                          Text(
                            WEIGHT.toString(),
                            style: textStyle2(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              CustomBtn(
                                icon: FontAwesomeIcons.minus,
                                function: () {
                                  setState(() {
                                    if (WEIGHT > 0) WEIGHT--;
                                    if (WEIGHT > 0) WEIGHT--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              CustomBtn(
                                icon: FontAwesomeIcons.plus,
                                function: () {
                                  setState(() {
                                    WEIGHT++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                      child: ReusbleCode(
                    color: activeCardColor,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: textStyle(Colors.white),
                        ),
                        Text(
                          age.toString(),
                          style: textStyle2(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            CustomBtn(
                              icon: FontAwesomeIcons.minus,
                              function: () {
                                setState(() {
                                  if (age > 0) age--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15,
                            ),
                            CustomBtn(
                              icon: FontAwesomeIcons.plus,
                              function: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  )),
                ],
              ),
            ),
            GestureDetector(
              onTap: Feedback.wrapForTap(() {
                CalculatorBrain calc =
                    CalculatorBrain(height: height, weight: WEIGHT);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => Results_page(
                      bmiResult: calc.getBMI(),
                      interpretation: calc.getInterpretation(),
                      resultText: calc.getResult(),
                    ),
                  ),
                );
              }, context),
              child: Container(
                child: Center(
                  child: Text(
                    'CALCULATE',
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
      ),
    );
  }
}
