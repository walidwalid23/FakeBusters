import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/reusable_widgets/add_post_form_field.dart';
import 'package:fakebustersapp/views/home_drawer.dart';
import 'package:flutter/material.dart';

class AddPost extends StatefulWidget {
  const AddPost({Key? key}) : super(key: key);

  @override
  State<AddPost> createState() => _AddPostState();
}

class _AddPostState extends State<AddPost> {
  String dropdownValue = "select";
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
            AddPostTextInputField(label: 'Product Name', validatorFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the product name';
              }
              return null;
            },),

            AddPostTextInputField(label: 'Brand Name', validatorFunc: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter the brand name';
              }
              return null;
            },),

            Padding(
              padding: const EdgeInsets.all(15),
              child: DropdownButtonFormField(
                value: dropdownValue,
                items: [
                  DropdownMenuItem<String>(
                    value: "select",
                    child: Text("Select Product Category",
                        style: TextStyle(color: Colors.grey)),
                    enabled: false,
                  ),
                  DropdownMenuItem<String>(
                    value: "electronics",
                    child: Text("Electronics"),
                  ),
                  DropdownMenuItem<String>(
                    value: "appliances",
                    child: Text("Appliances"),
                  ),
                  DropdownMenuItem<String>(
                    value: "fashion",
                    child: Text("Fashion"),
                  ),
                  DropdownMenuItem<String>(
                    value: "musicInstruments",
                    child: Text("Music Instruments"),
                  ),
                  DropdownMenuItem<String>(
                    value: "sportsEquipment",
                    child: Text("Sports Equipment"),
                  ),
                  DropdownMenuItem<String>(
                    value: "toys",
                    child: Text("Toys"),
                  )
                ],
                onChanged: (String? value){
                  setState((){
                    dropdownValue = value!;
                  });
                },
                validator: (value) {
                  if (value == null ) {
                    return 'Please select a category';
                  }
                  return null;
                },
                style: TextStyle(backgroundColor: Colors.blue),
           ),
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
        drawer: HomeDrawer()
    );
  }
}





