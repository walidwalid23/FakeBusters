import 'dart:io';
import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/reusable_widgets/add_post_form_field.dart';
import 'package:fakebustersapp/reusable_widgets/product_image.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';


class EditPost extends StatefulWidget {
  const EditPost({Key? key}) : super(key: key);

  @override
  State<EditPost> createState() => _EditPostState();
}

class _EditPostState extends State<EditPost> {
  String dropdownValue = "select";
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? productImage;
  String imageValidationError = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
        appBar: AppBar(
          title:Text(
              'Edit Post'
          ),
          centerTitle: true,
        ),
        body: Form(
          key: _formKey,
          child: ListView(

            children: [
              AddPostTextInputField(
                label: 'Product Name',
                validatorFunc: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the product name';
                }
                return null;
              },
              ),
              AddPostTextInputField(
                label: 'Brand Name',
                validatorFunc: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter the brand name';
                }
                return null;
              },
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: DropdownButtonFormField(
                  value: dropdownValue,
                  items: [
                    DropdownMenuItem<String>(
                      value: "select",
                      child: Text("Select Product Category",
                          style: TextStyle(
                              color: Colors.grey
                          )
                      ),
                      enabled: false,
                    ),
                    DropdownMenuItem<String>(
                      value: "electronics",
                      child: Text(
                          "Electronics",
                        style: StylesManager.textStyle2,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "appliances",
                      child: Text(
                          "Appliances",
                        style: StylesManager.textStyle2,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "fashion",
                      child: Text(
                          "Fashion",
                        style: StylesManager.textStyle2,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "musicInstruments",
                      child: Text(
                          "Music Instruments",
                        style: StylesManager.textStyle2,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "sportsEquipment",
                      child: Text(
                          "Sports Equipment",
                        style: StylesManager.textStyle2,
                      ),
                    ),
                    DropdownMenuItem<String>(
                      value: "toys",
                      child: Text(
                          "Toys",
                        style: StylesManager.textStyle2,
                      ),
                    )
                  ],
                  onChanged: (String? value){
                    setState((){
                      dropdownValue = value!;
                    });
                  },
                  validator: (value) {
                    if (value == null || value == 'select' ) {
                      return 'Please select a category';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black),
                        borderRadius: BorderRadius.circular(10)
                    ),
                  ),
                ),
              ),
              ProductImage(
                productImage: productImage,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: ElevatedButton(
                  child: const Text('Upload Product Image'),
                  onPressed: () async{
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image == null){
                      return;
                    }
                    setState(() {
                      productImage = File(image.path);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.themeColor1
                  ), ),
              ),
              Center(
                  child: Text(
                    imageValidationError,
                    style: StylesManager.notificationStyle,
                  )
              ),
              SizedBox(
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate() && productImage != null) {
                        print("everything is valid");
                      }
                      else if(productImage == null){
                        setState(() {
                          imageValidationError = 'Please Upload The Product Image';
                        });
                      }
                    },
                    child: const Text(
                        'Submit'
                    ),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsManager.themeColor1,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
        drawer: HomeDrawer()
    );
  }
}
