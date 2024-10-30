import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/screens/home/nav_bar_screens/add_hive_nav_screen.dart';
import 'package:bee_corp_app/screens/home/nav_bar_screens/home_nav_screen.dart';
import 'package:bee_corp_app/screens/home/nav_bar_screens/settings_nav_screen.dart';
import 'package:bee_corp_app/screens/login/login_screen.dart';
import 'package:bee_corp_app/screens/utils/common_utils.dart';
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
      text: "Adicionar Registro",
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
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    final SignInController _signInController = SignInController();

    return Scaffold(
      body: Center(
        child: widgets[_tabIndex],
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          color: colorScheme.surface,
          boxShadow: [
            BoxShadow(
              blurRadius: 20,
              color: Colors.black.withOpacity(.05),
            )
          ],
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
            child: GNav(
              color: colorScheme.inverseSurface,
              activeColor: colorScheme.inverseSurface,
              tabBackgroundColor: colorScheme.inversePrimary,
              onTabChange: (index) {
                try {
                  _signInController.getSignInUser();
                  setState(() => _tabIndex = index);
                } on Exception catch (_) {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                  CommonUtils.showSnackBar(
                      "Seu tempo de sessão expirou", Colors.red, context);
                }
              },
              padding: const EdgeInsets.all(10),
              tabs: tabButtons,
            ),
          ),
        ),
      ),
    );
  }
}
