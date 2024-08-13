import 'package:flutter/material.dart';
import 'package:hello_world/utils/theme.dart';

import '../../generated/l10n.dart';

class MyAdvertisingScreen extends StatelessWidget {
  const MyAdvertisingScreen({super.key});
  static String route = "/advertising";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialTheme.lightScheme().background,
        body: Padding(
          padding: const EdgeInsets.only(top: 150, right: 10, left: 10),
          child: ListView(
            children: [
              Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Center(
                      child: Icon(
                        Icons.post_add_outlined,
                        color: MaterialTheme.lightScheme().secondary,
                        size: 150,
                      ),
                    ),
                    Text(
                      S.of(context).addyourads,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: MaterialTheme.lightScheme().onSecondary),
                    ),
                    Text(
                      S.of(context).dontwait,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                          color: MaterialTheme.lightScheme().onSecondary),
                    ),
                    TextButton(
                      onPressed: () {},
                      style: TextButton.styleFrom(
                          backgroundColor:
                              MaterialTheme.lightScheme().background,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          shadowColor: MaterialTheme.lightScheme().shadow,
                          elevation: 4.0,
                          side: BorderSide(
                              color: MaterialTheme.lightScheme().secondary,
                              width: 3)),
                      child: Padding(
                        padding: const EdgeInsets.all(3.0),
                        child: Text(
                          S.of(context).letsstart,
                          style: TextStyle(
                              color: MaterialTheme.lightScheme().onSecondary),
                        ),
                      ),
                    ),
                    Container(height: MediaQuery.of(context).size.width / 1.2)
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
