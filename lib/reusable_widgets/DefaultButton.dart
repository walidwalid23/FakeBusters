import 'package:flutter/material.dart';
class defaultButton extends StatelessWidget {
  defaultButton({Key? key,
    required this.text,
    this.width = double.infinity,
    required this.function,
    this.background=Colors.blue,
  }) : super(key: key);

  String text;
  double width;
  var function;
  Color background;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      color: background,
      child: MaterialButton(
        onPressed:
        function,
        child: Text(
          text.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
Widget defaultFormField({
  required TextEditingController Controller,
  required TextInputType type,
  var onSubmit,
  var onChange,
  required String Label,
  required var validate,
  required IconData prefix,
  var onTap,
  var suffix,
  bool isPassword=false,
  var icon,
})=>TextFormField(
  validator:
    validate,
  controller:Controller,
  keyboardType: type,
  obscureText: isPassword,
  onFieldSubmitted: onSubmit,
  onChanged: onChange,
  onTap: onTap,
  decoration: InputDecoration(
    labelText: "${Label}",
    prefixIcon: Icon(
        prefix
    ),
    suffixIcon: suffix!= null? IconButton(
      onPressed: icon,
      icon: Icon(
          suffix
      ),
    ):null,
    border:OutlineInputBorder(),
  ),
);
