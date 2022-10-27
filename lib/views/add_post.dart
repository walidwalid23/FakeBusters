import 'package:flutter/material.dart';

class  AddPost extends StatelessWidget {
    AddPost({Key? key}) : super(key: key);
    
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TextFormField(
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter some text';
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
