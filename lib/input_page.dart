import 'dart:ffi';
import 'package:bmi_app_final/resultsPage.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ReusableCard.dart';
import 'IconContent.dart';
import 'constants.dart';
import 'calculatorBrain.dart';

enum Gender {
  male,
  female,
}

int _height = 180;
int weight = 60;
int age = 25;

class InputPage extends StatefulWidget {
  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {
                      setState(() {
                        selectedGender = Gender.male;
                      });
                    },
                    colour: selectedGender == Gender.male
                        ? kActiveCardColour
                        : kInActiveCardColour,
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
                        selectedGender = Gender.female;
                      });
                    },
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      label: 'FEMALE',
                    ),
                    colour: selectedGender == Gender.female
                        ? kActiveCardColour
                        : kInActiveCardColour,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              onPress: () {},
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'HEIGHT',
                    style: kLabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        _height.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text('cm', style: kLabelTextStyle),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      thumbColor: const Color(0xFFEB1555),
                      inactiveTrackColor: const Color(0xFF8D8E98),
                      activeTrackColor: Colors.white,
                      thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayColor: const Color(0x29EB1555),
                      overlayShape: const RoundSliderOverlayShape(overlayRadius: 30.0),
                    ),
                    child: Slider(
                          value: _height.toDouble(),
                          min: 120.0,
                          max: 220.0,
                          onChanged: (double value){
                            setState(() {
                              _height = value.toInt();
                            });
                          },
                        ),
                  )
                ],
              ),
              colour: kActiveCardColour,
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('WEIGHT', style: kLabelTextStyle),
                        Text(weight.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn1",
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(Icons.add),
                              onPressed:(){
                                setState(() {
                                  weight++;
                                });
                              }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: "btn2",
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  weight--;
                                });
                              }),
                          ],
                        )

                      ],
                    ) ,
                    colour: kActiveCardColour,
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: () {},
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('AGE', style: kLabelTextStyle),
                        Text(age.toString(), style: kNumberTextStyle),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center ,
                          children: [
                            FloatingActionButton(
                              heroTag: "btn3",
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(Icons.add),
                              onPressed:(){
                                setState(() {
                                  age++;
                                });
                              }),
                            const SizedBox(
                              width: 10.0,
                            ),
                            FloatingActionButton(
                              heroTag: "btn4",
                              backgroundColor: const Color(0xFF4C4F5E),
                              child: const Icon(Icons.remove),
                              onPressed: (){
                                setState(() {
                                  age--;
                                });
                              }),
                          ],
                        )

                      ],
                    ) ,
                    colour: kActiveCardColour,
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
            
            onTap: (){

            calculatorBrain calc = calculatorBrain(height: _height, weight: weight);
            Navigator.push(context, MaterialPageRoute(builder: ((context) => resultsPage(bmiResult: calc.CalculateBMI(), resultText: calc.getResult(), interpretation: calc.getInterpretation()))));

            
            },
            child: Container(
              child: Center(child: Text("Calculate", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
              color: kBottomContainerColour,
              margin: EdgeInsets.only(top: 10.0),
              width: double.infinity,
              height: kBottomContainerHeight,
            ),
          ),
        ],
      ),
    );
  }
}
