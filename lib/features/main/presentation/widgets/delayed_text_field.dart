import 'dart:async';

import 'package:flutter/material.dart';

class DelayedTextField extends StatefulWidget {
  const DelayedTextField({ Key? key }) : super(key: key);

  @override
  State<DelayedTextField> createState() => _DelayedTextFieldState();
}

class _DelayedTextFieldState extends State<DelayedTextField> {
  Timer? _timer;
  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: (value) {
        if (_timer != null) {
          _timer!.cancel();
          _timer = null;
        }
        _timer = Timer(const Duration(seconds: 2), () {
          _timer = null;
        });
        
      },
      
    );
  }

}