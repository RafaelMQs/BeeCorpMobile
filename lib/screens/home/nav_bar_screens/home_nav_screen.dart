import 'dart:developer';

import 'package:bee_corp_app/controllers/hive_controller.dart';
import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/models/hive_model.dart';
import 'package:bee_corp_app/models/sign_in_model.dart';
import 'package:flutter/material.dart';

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreen();
}

class _HomeNavScreen extends State<HomeNavScreen> {
  final HiveController _hiveController = HiveController();
  final SignInController _signInController = SignInController();

  List<HiveModel> hiveModels = [];
  late SignInModel loginUser;

  @override
  void initState() {
    loginUser = _signInController.getSignInUser();
    hiveModels = _hiveController.getHivesBasedInUserId(loginUser.userId);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: const Text('Registros'),
        backgroundColor: colorScheme.inversePrimary,
        shadowColor: colorScheme.shadow,
        elevation: 1,
      ),
      body: const Center(
        child: Text("Home"),
      ),
    );
  }
}
