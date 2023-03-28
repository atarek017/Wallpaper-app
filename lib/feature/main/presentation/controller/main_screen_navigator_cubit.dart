import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../favourite/presentation/screens/favourite_screen.dart';
import '../../../home/presentation/screens/home_screen.dart';
import '../../../search/presentation/screens/search_screen.dart';
import '../../domain/enum/main_tabs.dart';

part 'main_screen_navigator_state.dart';

class MainScreenNavigatorCubit extends Cubit<MainScreenNavigatorState> {
  PageController? pageController;
  MainTabsEnum currentTab = MainTabsEnum.home;

  MainScreenNavigatorCubit() : super(MainScreenNavigatorInitial()) {
    pageController = PageController(initialPage: currentTab.index);
  }

  final tabs = [
    HomeScreen(),
    SearchScreen(),
    FavouriteScreen(),
  ];

  changeTab(int index) {
    currentTab = MainTabsEnum.values.elementAt(index);
    pageController!.jumpToPage(index);
    emit(MainNavigationChange(index));
  }
}
