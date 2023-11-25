import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:rick_morty_app/presentation/screens/charecters_page.dart';
import 'package:rick_morty_app/presentation/theme/app_colors.dart';
import 'package:rick_morty_app/resources/resources.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int currentIndex = 0;

  List<Widget> screens = [
    CharectersPage(),
    CharectersPage(),
    CharectersPage(),
    CharectersPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: screens[currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppColors.green,
        unselectedItemColor: AppColors.darkTextColor,
        currentIndex: currentIndex,
        onTap: (val) {
          currentIndex = val;
          setState(() {});
        },
        items: [
          BottomNavigationBarItem(
            icon: SvgPicture.asset(
              AppSvgs.chars,
              colorFilter: const ColorFilter.mode(
                Colors.green,
                BlendMode.srcIn,
              ),
            ),
            label: 'Персонажи',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.location),
            label: 'Локациии',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.episode),
            label: 'Эпизоды',
          ),
          BottomNavigationBarItem(
            icon: SvgPicture.asset(AppSvgs.settings),
            label: 'Настройки',
          ),
        ],
      ),
    );
  }
}
