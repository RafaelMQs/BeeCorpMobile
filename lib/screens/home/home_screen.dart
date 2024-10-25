import 'package:bee_corp_app/screens/home/nav_bar_screens/add_hive_nav_screen.dart';
import 'package:bee_corp_app/screens/home/nav_bar_screens/home_nav_screen.dart';
import 'package:bee_corp_app/screens/home/nav_bar_screens/settings_nav_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  int _tabIndex = 0;

  List<GButton> tabButtons = const [
    GButton(
      icon: Icons.hive,
      text: "Pagina Inicial",
    ),
    GButton(
      icon: Icons.add,
      text: "Adicionar Colmeias",
    ),
    GButton(
      icon: Icons.settings,
      text: "Configurações",
    ),
  ];

  List<Widget> widgets = const [
    HomeNavScreen(),
    AddHiveNavScreen(),
    SettingsNavScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: widgets[_tabIndex],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
        child: GNav(
          color: Theme.of(context).colorScheme.inverseSurface,
          activeColor: Theme.of(context).colorScheme.inverseSurface,
          tabBackgroundColor: Theme.of(context).colorScheme.inversePrimary,
          onTabChange: (index) => setState(() => _tabIndex = index),
          padding: const EdgeInsets.all(10),
          tabs: tabButtons,
        ),
      ),
    );
  }
}
