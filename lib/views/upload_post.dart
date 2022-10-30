// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_print, sort_child_properties_last

import 'package:fakebustersapp/models/colors_manager.dart';
import 'package:fakebustersapp/models/styles_manager.dart';
import 'package:fakebustersapp/reusable_widgets/add_post_form_field.dart';
import 'package:fakebustersapp/reusable_widgets/product_image.dart';
import 'package:fakebustersapp/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class UploadPost extends StatefulWidget {
  const UploadPost({Key? key}) : super(key: key);

  @override
  State<UploadPost> createState() => _UploadPostState();
}

class _UploadPostState extends State<UploadPost> {
  String dropdownValue = "select";
  final _formKey = GlobalKey<FormState>();
  final ImagePicker _picker = ImagePicker();
  File? productImage;
  String imageValidationError = '';

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(title:Text('Add Post'), centerTitle: true,),
      body: SafeArea(
        child: Form(
          key: _formKey,
          child: ListView(

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

              ProductImage(productImage: productImage,),

              Padding(
                padding: const EdgeInsets.all(15),
                child: ElevatedButton(
                  child: const Text('Upload Product Image'),
                  onPressed: () async{
                    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
                    if(image == null){return;}
                    setState(() {
                      productImage = File(image.path);
                    });
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: ColorsManager.themeColor1
                  ), ),
              )
              ,
              Center(child: Text(imageValidationError,style: StylesManager.notificationStyle,)),

                 Padding(
                   padding: const EdgeInsets.all(15),
                   child: SizedBox(
                     child: ElevatedButton(
                       child: Text('Submit',),
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



                      style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsManager.themeColor1,

                      ), ),
                   ),
                 ),


            ],
          ),
        ),
      ),
        drawer: HomeDrawer()
    );
  }
}





