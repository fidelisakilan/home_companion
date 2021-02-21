import 'package:flutter/material.dart';
import 'package:step_progress_indicator/step_progress_indicator.dart';

class DetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Stats'),
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: Color(0xff232F4D),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          DetailsCard(7, 5, 5, 'Admin Block'),
          DetailsCard(3, 6, 8, 'Laboratory'),
          DetailsCard(7, 6, 9, 'Student Block'),
        ],
      ),
    );
  }
}

class DetailsCard extends StatelessWidget {
  final int energyNo, tempNo, waterNo;
  final String blockName;

  const DetailsCard(this.energyNo, this.tempNo, this.waterNo, this.blockName);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              blockName,
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 24,
                  fontWeight: FontWeight.bold),
            ),
          ),
          Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(18)),
            color: Color(0xff343434),
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    'Energy',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: energyNo,
                    selectedColor: Color(0xfff7b295),
                    unselectedColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Temperature',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: tempNo,
                    selectedColor: Color(0xffbf6b82),
                    unselectedColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    'Water',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.w100),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  StepProgressIndicator(
                    totalSteps: 10,
                    currentStep: waterNo,
                    selectedColor: Colors.lightBlue,
                    unselectedColor: Colors.transparent,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
