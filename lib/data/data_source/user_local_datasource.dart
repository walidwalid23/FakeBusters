import 'package:fakebustersapp/core/exception_handling/exceptions.dart';
import 'package:fakebustersapp/data/data_source/base_user_local_datasource.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserLocalDataSource extends BaseUserLocalDataSource{
  @override
  Future<String> logout() async{
    final prefs = await SharedPreferences.getInstance();
    final tokenIsRemoved = await prefs.remove('userToken');

    if(tokenIsRemoved){
      return "Logged Out";
    }
    else{
      throw LocalDatabaseException(errorMessage: "Couldn't remove the token");
    }


  }

}