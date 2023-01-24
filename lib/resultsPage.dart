import 'package:flutter/material.dart';
import 'constants.dart';
import 'calculatorBrain.dart';

class resultsPage extends StatelessWidget {

  resultsPage({required this.bmiResult, required this.resultText, required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Your Result", style: TextStyle(
          fontSize: 40, fontWeight: FontWeight.bold, color: Colors.white,
        ),
        ),
      ),
      body: ListView(
        children: [
          Container(
          height: 472,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Color(0xFF1D1E33),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            
            children: [
              Container(
                child: Text("$resultText", style: TextStyle(fontSize: 22, color: Color.fromARGB(255, 85, 236, 90), fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: 60,
              ),
              Container(
                child: Text("$bmiResult", style: TextStyle(fontSize: 70, color: Colors.white, fontWeight: FontWeight.bold),),
              ),
              SizedBox(
                height: 90,
              ),
              Container(
                child: Text("$interpretation", style: TextStyle(fontSize: 19, color: Colors.white, fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
              ),
              
              
            ],
          ),
        ),
        GestureDetector(
              
              onTap: (){
              Navigator.pop(context);
              },
              child: Container(
                child: Center(child: Text("Re-Calculate", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),)),
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