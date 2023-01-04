import 'package:flutter/material.dart';
import 'dart:io';
class Post{
String productName;
String brandName;
String productCategory;
File productImage;
int? fakeVotes;
int? originalVotes;
String? postDate;

Post({required this.productName, required this.brandName, required this.productCategory,
required this.productImage});
}