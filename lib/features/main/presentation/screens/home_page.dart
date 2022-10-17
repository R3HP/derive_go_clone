import 'package:deriv_go_clone/features/main/presentation/widgets/appbar.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/button_sction.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/chart_section.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/chart_setting_section.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/multiplier_section.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/risk_managment_section.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Scaffold(
        drawer: const Drawer(),
        appBar: const MyAppBar(),
        body: Column(
          children: [
            const ChartSettingSection(),
            const Expanded(
              flex: 3,
              child: ChartSection()),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 11.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Text('Stop out : 10.00 USD'),
                  Text('Commission : 0.02 USD')
                ],
              ),
            ),
            const Expanded(child: MultiplerSection()),
            const Expanded(child: RiskManagmentSection()),
            const Expanded(child: ButtonSection())
          ],
        ),
      ),
    );
  }
}


