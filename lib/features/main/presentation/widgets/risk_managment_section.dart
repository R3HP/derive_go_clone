import 'package:flutter/material.dart';

class RiskManagmentSection extends StatelessWidget {
  const RiskManagmentSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2.0),
      padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 25.0),
      decoration:
          BoxDecoration(color: Theme.of(context).primaryColor.withAlpha(255)),
      child: InkWell(
        onTap: () {},
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [Text('Risk Management'), Text('Not Set')],
        ),
      ),
    );
  }
}

