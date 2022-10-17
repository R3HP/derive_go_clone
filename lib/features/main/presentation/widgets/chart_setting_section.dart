import 'package:deriv_go_clone/features/main/presentation/widgets/asset_model_bottom_sheet.dart';
import 'package:deriv_go_clone/features/main/presentation/widgets/chart_setting_bottom_sheet.dart';
import 'package:flutter/material.dart';

class ChartSettingSection extends StatelessWidget {
  const ChartSettingSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          margin: const EdgeInsets.all(10.0),
          padding: const EdgeInsets.all(4.0),
          decoration: BoxDecoration(
              color: Theme.of(context).primaryColor.withAlpha(255)),
          child: InkWell(
            onTap: () {
              showModalBottomSheet(
                  context: context, builder: (ctx) => const AssetsModalBottomSheet());
            },
            child: Row(
              children: [
                Image.asset('assets/images/volatility.png',
                    width: 40, height: 40, color: Colors.white),
                const SizedBox(
                  width: 5,
                ),
                const Text('Volatility 100 (1s) Index')
              ],
            ),
          ),
        )),
        InkWell(
          onTap: () {
            showModalBottomSheet(
                context: context, builder: (ctx) => const ChartSettingBottomSheet());
          },
          child: Container(
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withAlpha(255)),
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.all(12.0),
            
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('1M'),
                Icon(
                  Icons.ssid_chart_sharp,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
