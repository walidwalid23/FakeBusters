import 'package:fakebustersapp/data/data_source/user_local_datasource.dart';

class ThemeModeUsecase {
  UserLocalDataSource userLocalDataSource;
  
  ThemeModeUsecase( this.userLocalDataSource);

  Future<String> excute(String theme) async {
    return await userLocalDataSource.setTheme(theme);

  }
}
