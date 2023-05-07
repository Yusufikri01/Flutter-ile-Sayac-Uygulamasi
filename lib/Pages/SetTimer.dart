import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:percent_indicator_use/Pages/Timer.dart';
import 'package:percent_indicator_use/Widget/NumberPro.dart';

class SelectTime extends StatefulWidget {
  const SelectTime({Key? key}) : super(key: key);

  @override
  State<SelectTime> createState() => _SelectTimeState();
}

class _SelectTimeState extends State<SelectTime> {
  int toplam = 0;
  int selectedHoursIndex = 0;
  int selectedMinutesIndex = 0;
  int selectedSecondsIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: 130,
              width: 130,
              child: Lottie.network(
                "https://assets9.lottiefiles.com/packages/lf20_jdssfb7n.json",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                //HOURS
                Container(
                  height: 175,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 24,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedHoursIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
                //MUNİTE
                Container(
                  height: 175,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedMinutesIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
                //SECOND
                Container(
                  height: 160,
                  width: 80,
                  child: ListWheelScrollView.useDelegate(
                    itemExtent: 50,
                    perspective: 0.01,
                    diameterRatio: 1.2,
                    physics: FixedExtentScrollPhysics(),
                    childDelegate: ListWheelChildBuilderDelegate(
                      childCount: 60,
                      builder: (context, index) {
                        return NumberPro(index);
                      },
                    ),
                    onSelectedItemChanged: (index) {
                      setState(() {
                        selectedSecondsIndex = index;
                        toplam = (selectedHoursIndex * 3600) +
                            (selectedMinutesIndex * 60) +
                            selectedSecondsIndex;
                      });
                    },
                  ),
                ),
              ],
            ),
            FloatingActionButton(
              backgroundColor: Colors.amberAccent,
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => HomePage(toplam),
                  ),
                );
              },
              child: Icon(
                Icons.play_arrow,
                size: 25,
                color: Colors.white,
              ),
            )
          ],
        ),
      ),
    );
  }
}
