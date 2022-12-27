import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
class ProductImage extends StatelessWidget {
  ProductImage({Key? key,this.productImage}) : super(key: key);

  File? productImage;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      child: (productImage==null)?Image.asset('assets/images/blankimage.png') :Image.file(productImage!),
    );
  }
}
