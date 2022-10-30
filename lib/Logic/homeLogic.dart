import 'package:fakebustersapp/models/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:fakebustersapp/globals.dart';
void fakeBusterChoice(){
  pageController.animateToPage(2,
      duration: Duration(milliseconds: ValuesManager.swipePageAnimationDuration),
      curve: Curves.easeInCirc);
}

void bustersSeekerChoice(){
  pageController.animateToPage(3,
      duration: Duration(milliseconds: ValuesManager.swipePageAnimationDuration),
      curve: Curves.easeInCirc);
}
