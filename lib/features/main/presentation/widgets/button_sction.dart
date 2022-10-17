import 'package:flutter/material.dart';

class ButtonSection extends StatelessWidget {
  const ButtonSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          margin: const EdgeInsets.only(left: 8, right: 5.0, top: 2.0),
          decoration: BoxDecoration(
              color: Colors.green, borderRadius: BorderRadius.circular(5)),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.arrow_upward,
                ),
                Text('UP'),
              ],
            ),
          ),
        )),
        Expanded(
            child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20),
          margin: const EdgeInsets.only(right: 8.0, left: 5.0, top: 2.0),
          decoration: BoxDecoration(
              color: Colors.red, borderRadius: BorderRadius.circular(5)),
          child: InkWell(
            onTap: () {},
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Icon(
                  Icons.arrow_downward,
                ),
                Text('Down'),
              ],
            ),
          ),
        )),
      ],
    );
  }
}
