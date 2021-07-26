import 'package:bmi_calculator01/results_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator01/icon_content.dart';
import 'package:bmi_calculator01/reusable_card.dart';
import 'package:bmi_calculator01/constants.dart';
import 'package:bmi_calculator01/calculator_brain.dart';
enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Color maleCardColour = kInactiveCardColour;
  Color femaleCardColour = kInactiveCardColour;
  double height = 180;
  int weight = 60;
  int age = 20;

  void updateColour(Gender selectedGender) {
    if (selectedGender == Gender.male) {
      if (maleCardColour == kInactiveCardColour) {
        maleCardColour = kActiveCardColor;
        femaleCardColour = kInactiveCardColour;
      } else {
        maleCardColour = kInactiveCardColour;
      }
    }
    if (selectedGender == Gender.female) {
      if (femaleCardColour == kInactiveCardColour) {
        femaleCardColour = kActiveCardColor;
        maleCardColour = kInactiveCardColour;
      } else {
        femaleCardColour = kInactiveCardColour;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff1A1A25),
      appBar: AppBar(
        title: Center(
            child: Text(
          "BMI  Calculator",
          style: TextStyle(color: Color(0xffDB1B6F)),
        )),
        backgroundColor: Color(0xff1A1A25),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      updateColour(Gender.male);
                    });
                  },
                  colour: maleCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.mars,
                    label: 'MALE',
                  ),
                ),
              ),
              Expanded(
                child: ReusableCard(
                  onPress: () {
                    setState(() {
                      updateColour(Gender.female);
                    });
                  },
                  colour: femaleCardColour,
                  cardChild: IconContent(
                    icon: FontAwesomeIcons.venus,
                    label: 'FEMALE',
                  ),
                ),
              ),
            ]),
          ),
          Expanded(
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                textBaseline: TextBaseline.alphabetic,
                children: <Widget>[
                  Text(
                    "HEIGHT",
                    style: kLebelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        "CM",
                        style: kLebelTextStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderThemeData(
                      trackHeight: 2,
                      thumbShape: RoundSliderThumbShape(
                          enabledThumbRadius: 15, elevation: 7),
                      activeTrackColor: Colors.white,
                      thumbColor: Color(0xffDB1B5F),
                      overlayColor: Colors.white30,
                    ),
                    child: Slider(
                        value: height.toDouble(),
                        min: 120.0,
                        max: 240.0,
                        inactiveColor: Color(0xffDB1B5F),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.roundToDouble();
                          });
                        }),
                  ),
                ],
              ),
              onPress: null,
            ),
          ),
          Expanded(
            child: Row(children: <Widget>[
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "WEIGHT",
                        style: kLebelTextStyle,
                      ),
                      Text(
                        weight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          // RoundIconButton(
                          //   icon: FontAwesomeIcons.minus,
                          //   onPressed: () {
                          //     setState(() {
                          //       weight--;
                          //     });
                          //   },
                          // ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                weight--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus),
                            color: Color(0xffDB1B5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            height: 56.0,
                            minWidth: 56.0,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                weight++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus),
                            color: Color(0xffDB1B5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            height: 56.0,
                            minWidth: 56.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPress: null,
                ),
              ),
              Expanded(
                child: ReusableCard(
                  colour: kActiveCardColor,
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "AGE",
                        style: kLebelTextStyle,
                      ),
                      Text(
                        age.toString(),
                        style: kNumberTextStyle,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                age--;
                              });
                            },
                            child: Icon(FontAwesomeIcons.minus),
                            color: Color(0xffDB1B5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            height: 56.0,
                            minWidth: 56.0,
                          ),
                          SizedBox(
                            width: 15,
                          ),
                          FlatButton(
                            onPressed: () {
                              setState(() {
                                age++;
                              });
                            },
                            child: Icon(FontAwesomeIcons.plus),
                            color: Color(0xffDB1B5F),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0)),
                            height: 56.0,
                            minWidth: 56.0,
                          ),
                        ],
                      ),
                    ],
                  ),
                  onPress: null,
                ),
              ),
            ]),
          ),
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ResultPage()));
              });
            },
            child: Container(
              child: Center(
                child: Text("Calculate Your BMI",
                    style:
                        TextStyle(fontSize: 33, fontWeight: FontWeight.w600,color: Color(0xff1A2A45),),),
              ),
              width: double.infinity,
              height: kBottomContainerHeight,
              margin: EdgeInsets.only(top: 10),
              decoration: BoxDecoration(
                color: kBottomContainerColor,
                borderRadius: BorderRadius.only(topRight: Radius.circular(25),topLeft: Radius.circular(25),),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
