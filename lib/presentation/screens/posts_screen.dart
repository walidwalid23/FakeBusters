import 'package:fakebustersapp/core/utils/constants/colors_manager.dart';
import 'package:fakebustersapp/domain/entities/post.dart';
import 'package:fakebustersapp/core/utils/constants/styles_manager.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/post_choice_button.dart';
import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
class PostsScreen extends StatelessWidget {
  const PostsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title:Text('Your Post'), centerTitle: true,),
      body: SafeArea(
        child:Text("")
      ),
      drawer: HomeDrawer(),
      backgroundColor: Colors.grey[400],

    );
  }
}

