import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:flutter/material.dart';
class HintScreen extends StatelessWidget {
  const HintScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
            Text(
                'How to know whether it\'s fake or not',
              style: StylesManager.textStyle2,
            ),
          ],
        ),
      ),
    );
  }
}
