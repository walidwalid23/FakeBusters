import 'package:fakebustersapp/presentation/controller/user_providers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../../core/utils/constants/colors_manager.dart';

class InitialLoadingScreen extends ConsumerWidget {
  const InitialLoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: SafeArea(
      child: Center(
        child: ref.watch(verifyUserTokenProvider(context)).when(
            data: (data)=>Container(),
            error: (error,trace)=>Text(error.toString()),
            loading: ()=>SpinKitRing(color: ColorsManager.themeColor1!))
      ),
    ),);
  }
}
