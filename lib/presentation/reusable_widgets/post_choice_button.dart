import 'package:flutter/material.dart';

class PostChoiceButton extends StatelessWidget {
    PostChoiceButton({Key? key, required this.buttonText, required this.buttonAction}) : super(key: key);

  VoidCallback buttonAction;
  String buttonText;

  @override
  Widget build(BuildContext context) {
    return TextButton(onPressed: buttonAction,
        child: Padding(
          padding: const EdgeInsets.only(left:40, right:40),
          child: Text(buttonText,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: Colors.deepOrangeAccent
            ),),
        ),
        style: ButtonStyle(
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
              RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18.0),
                  side: BorderSide(color: Colors.deepOrange)
              ),)
        )
    );
  }
}
