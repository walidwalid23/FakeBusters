import 'package:flutter/material.dart';
import 'dart:io';
class PostModel{
String productName;
String brandName;
String productCategory;
File productImage;
PostModel({required this.productName, required this.brandName, required this.productCategory,
required this.productImage});
}