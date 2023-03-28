part of 'main_screen_navigator_cubit.dart';

abstract class MainScreenNavigatorState {}

class MainScreenNavigatorInitial extends MainScreenNavigatorState {}

class MainNavigationChange extends MainScreenNavigatorState {
  int index;

  MainNavigationChange(this.index);
}
