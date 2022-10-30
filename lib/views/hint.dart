import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:flutter/material.dart';
class HintScreen extends StatelessWidget {
  const HintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> str = [
      "Hello World",
      "This is FlutterCampus",
      "Learn App Building.",
      "Flutter is the Best"];
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
              'Hints',
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Text(
                'How to know whether it\'s fake or not?',
              style: StylesManager.textStyle2,
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                  children:[
                    Text(
                      "\u2022",
                      style: TextStyle(
                          fontSize: 16
                      ),
                    ), //bullet text
                    SizedBox(
                      width: 10,
                    ), //space between bullet and text
                    Expanded(
                      child:Text(
                        "Check the Logo Dimensions",
                        style: TextStyle(
                            fontSize: 16
                        ),
                      ), //text
                    ),
                  ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
