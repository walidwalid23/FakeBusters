import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/reusable_widgets/add_post_form_field.dart';
import 'package:flutter/material.dart';

class AddPost extends StatelessWidget {
    AddPost({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text('Add Product'), centerTitle: true,),
      body: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(15),
              child:AddPostTextInputField(label: 'Product Name', validatorFunc: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product name';
                }
                return null;
              },)

            ),

           ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {

                  }
                },
                child: const Text('Submit'),
             style: ElevatedButton.styleFrom(
               backgroundColor: ColorsManager.themeColor1
             ), ),

          ],
        ),
      ),
    );
  }
}
