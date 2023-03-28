import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:wallpaper_app/core/resources/app_strings.dart';
import 'package:wallpaper_app/core/resources/assets_manger.dart';
import 'package:wallpaper_app/core/resources/color_manger.dart';
import 'package:wallpaper_app/core/services/services_locator.dart';

import '../../../../core/resources/value_manger.dart';
import '../controller/main_screen_navigator_cubit.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => instance<MainScreenNavigatorCubit>(),
      child: BlocBuilder<MainScreenNavigatorCubit, MainScreenNavigatorState>(
        builder: (context, state) {
          return Scaffold(
            body: PageView(
              controller:
                  context.read<MainScreenNavigatorCubit>().pageController,
              children: context.read<MainScreenNavigatorCubit>().tabs,
              onPageChanged: (int index) {
                context.read<MainScreenNavigatorCubit>().changeTab(index);
              },
            ),
            bottomNavigationBar: BottomNavigationBar(
              elevation: 0.9,
              iconSize: 21,
              unselectedFontSize: 10.0,
              selectedFontSize: 10.0,
              type: BottomNavigationBarType.fixed,
              currentIndex:
                  context.read<MainScreenNavigatorCubit>().currentTab.index,
              onTap: context.read<MainScreenNavigatorCubit>().changeTab,
              items: [
                /// home
                BottomNavigationBarItem(
                  label: AppStrings.home,
                  icon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.home,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.homeActive,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),

                /// search

                BottomNavigationBarItem(
                  label: AppStrings.search,
                  icon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.search,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.searchActive,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),

                /// Favorite
                BottomNavigationBarItem(
                  label: AppStrings.favorite,
                  icon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.heart,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                  activeIcon: SizedBox(
                    child: SvgPicture.asset(
                      IconAssets.heartActive,
                      color: ColorManger.mainColor,
                      height: 25.0,
                      width: 25.0,
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
