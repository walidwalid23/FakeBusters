import 'package:flutter/material.dart';

class  AddPost extends StatelessWidget {
    AddPost({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: InputDecoration(),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the product name';
              }
              else if(value.length==200){
                return 'product name is too big';
              }
              return null;
            },
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16.0),
            child: ElevatedButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {


                }
              },
              child: const Text('Submit'),
            ),
          ),
        ],
      ),
    );
  }
}
