import 'package:flutter/material.dart';

void snackBar(context, {required String text}) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(text)));
}
