import 'package:flutter/material.dart';

showSnackBar(context, String msg, Color color) {
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: SizedBox(
        height: 30,
        child: Center(
          child: Text(
            msg,
            style: const TextStyle(color: Colors.white),
          ),
        ),
      ),
      backgroundColor: color,
      elevation: 10,
      behavior: SnackBarBehavior.floating,
      margin: const EdgeInsets.all(5),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(20.0)),
      ),
      duration: const Duration(seconds: 2),
    ),
  );
}
