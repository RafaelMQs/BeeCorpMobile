import 'package:bee_corp_app/screens/home/components/default_nav_screen.dart';
import 'package:flutter/material.dart';

import 'package:bee_corp_app/controllers/hive_controller.dart';
import 'package:bee_corp_app/controllers/sign_in_controller.dart';
import 'package:bee_corp_app/models/hive_model.dart';
import 'package:bee_corp_app/models/sign_in_model.dart';
import 'package:bee_corp_app/screens/home/components/slider_screen.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart' as intl;

class HomeNavScreen extends StatefulWidget {
  const HomeNavScreen({super.key});

  @override
  State<HomeNavScreen> createState() => _HomeNavScreen();
}

class _HomeNavScreen extends State<HomeNavScreen> {
  final HiveController _hiveController = HiveController();
  final SignInController _signInController = SignInController();
  late intl.DateFormat dateFormat;

  List<HiveModel> hiveModels = [];
  late SignInModel loginUser;

  final sliderImages = [
    Image.asset(
      "assets/slider/24_Melipona-marginata.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/slider/Melipona-flavolineata.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/slider/Melipona-fasciculata.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/slider/Melipona-bicolor.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/slider/Frieseomelitta-varia-1.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    ),
    Image.asset(
      "assets/slider/Friesella-schrottkyi-1.jpg",
      width: 1920,
      height: 1080,
      fit: BoxFit.cover,
    )
  ];

  final sliderImagesFull = [
    Image.asset(
      "assets/slider/24_Melipona-marginata.jpg",
      width: 1920,
      height: 1080,
    ),
    Image.asset(
      "assets/slider/Melipona-flavolineata.jpg",
      width: 1920,
      height: 1080,
    ),
    Image.asset(
      "assets/slider/Melipona-fasciculata.jpg",
      width: 1920,
      height: 1080,
    ),
    Image.asset(
      "assets/slider/Melipona-bicolor.jpg",
      width: 1920,
      height: 1080,
    ),
    Image.asset(
      "assets/slider/Frieseomelitta-varia-1.jpg",
      width: 1920,
      height: 1080,
    ),
    Image.asset(
      "assets/slider/Friesella-schrottkyi-1.jpg",
      width: 1920,
      height: 1080,
    )
  ];

  @override
  void initState() {
    super.initState();
    initializeDateFormatting();
    loginUser = _signInController.getSignInUser();
    hiveModels = _hiveController.getHivesBasedInUserId(loginUser.userId);
    dateFormat = intl.DateFormat.yMMMd('pt_BR');
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;

    return DefaultNavScreen(
      title: 'Registros',
      body: Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              flex: 5,
              child: SliderScreen(
                images: sliderImages,
                imagesFull: sliderImagesFull,
              ),
            ),
            getListWidget(colorScheme)
          ],
        ),
      ),
    );
  }

  Widget getListWidget(ColorScheme colorScheme) {
    if (hiveModels.isNotEmpty) {
      return Expanded(
        flex: 12,
        child: SizedBox(
          child: ListView.separated(
            shrinkWrap: true,
            itemBuilder: ((context, index) => Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Card(
                    child: ListTile(
                      title: Text('Colmeia: ${hiveModels[index].hiveCode}'),
                      leading: Icon(
                        Icons.hive,
                        color: colorScheme.inversePrimary,
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        textDirection: TextDirection.rtl,
                        children: [
                          Text('Peso: ${hiveModels[index].hiveWeight} mg'),
                          Wrap(
                            children: [
                              Text('Status: ${hiveModels[index].hiveStatus}'),
                            ],
                          ),
                          Text(
                              'Data do Registro: ${dateFormat.format(DateTime.parse(hiveModels[index].hiveCreationDate))}'),
                        ],
                      ),
                    ),
                  ),
                )),
            separatorBuilder: (_, index) => const Divider(),
            itemCount: hiveModels.length,
          ),
        ),
      );
    } else {
      return const Expanded(
        flex: 12,
        child: Center(
          child: Text('Você não possui nenhum registo'),
        ),
      );
    }
  }
}
