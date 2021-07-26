import 'package:bmi_calculator01/constants.dart';
import 'package:bmi_calculator01/inpute_page.dart';
import 'package:bmi_calculator01/reusable_card.dart';
import 'package:flutter/material.dart';
import 'constants.dart';





class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.interpretation,required this.resultText});
  final String bmiResult;
  final String resultText;
  final String interpretation;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 14,
          title: Center(
            child: Text(
              "Calculate ",
              style: kLebelTextStyle,
            ),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Text(
                  "Your Result Is ",
                  style: kTitleTextStyle,
                  textAlign: TextAlign.center,
                ),
              ),
            ),
            Expanded(
              flex: 5,
              child: ReusableCard(
                colour: kActiveCardColor,
                onPress: () {},
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      resultText.toUpperCase(),
                      style: kResultTextStyle,
                    ),
                    Text(bmiResult, style: kBMITextStyle,),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(interpretation,
                        style: kBodyTextStyle,
                        textAlign: TextAlign.center,),
                    ),
                  ],
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pop(context);
              },
              child: Container(
                child: Center(
                  child: Text("RE-Calculate",
                    style:
                    TextStyle(fontSize: 33,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff1A2A45),),),
                ),
                width: double.infinity,
                height: kBottomContainerHeight,
                margin: EdgeInsets.only(top: 10),
                decoration: BoxDecoration(
                  color: kBottomContainerColor,
                  borderRadius: BorderRadius.only(topRight: Radius.circular(25),
                    topLeft: Radius.circular(25),),
                ),
              ),
            ),

          ],
        ));
  }
}
