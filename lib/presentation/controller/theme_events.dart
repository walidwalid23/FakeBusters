import 'package:fakebustersapp/domain/usecases/theme_mode_usecase.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/data_source/user_local_datasource.dart';

class ThemesState extends StateNotifier<AsyncValue<String>> {
  ThemesState() : super(AsyncLoading()) {
    initThemeState();
  }

  void initThemeState() async {
    UserLocalDataSource localDataSource = UserLocalDataSource();
    String? theme = await localDataSource.getTheme();
    if (theme != null) {
      state = AsyncData(theme);
    } else {
      state = AsyncData("light");
    }
  }

  void setThemeState(String theme) async {
    UserLocalDataSource localDataSource = UserLocalDataSource();

    ThemeModeUsecase themeModeUsecase = ThemeModeUsecase(localDataSource);
    state = AsyncLoading();
    String themeStyle = await themeModeUsecase.excute(theme);

    state = AsyncData(themeStyle);
  }
}
