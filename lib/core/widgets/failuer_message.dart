import 'dart:math';

import 'package:flutter/material.dart';

class FailuerMessage extends StatelessWidget {
  const FailuerMessage({super.key, required this.errorMessage});
final String errorMessage;
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Text(errorMessage),
    );
  }
}