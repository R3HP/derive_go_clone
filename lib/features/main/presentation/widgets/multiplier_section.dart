import 'package:flutter/material.dart';

class MultiplerSection extends StatelessWidget {
  const MultiplerSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Flexible(
          flex: 3,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            padding: const EdgeInsets.all(5.0),
            decoration: BoxDecoration(
                color: Theme.of(context).primaryColor.withAlpha(255)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(onPressed: () {}, icon: const Icon(Icons.remove)),
                TextButton(onPressed: () {}, child: const Text('10 USD')),
                IconButton(onPressed: () {}, icon: const Icon(Icons.add)),
              ],
            ),
          ),
        ),
        Flexible(
          flex: 1,
          child: Container(
              margin: const EdgeInsets.all(8.0),
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 5.0),
              decoration: BoxDecoration(
                  color: Theme.of(context).primaryColor.withAlpha(255)),
              child: TextButton(onPressed: () {}, child: const FittedBox(child: Text('X10')))),
        )
      ],
    );
  }
}
