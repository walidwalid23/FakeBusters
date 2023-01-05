import 'package:fakebustersapp/presentation/reusable_widgets/home_drawer.dart';
import 'package:flutter/material.dart';

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

