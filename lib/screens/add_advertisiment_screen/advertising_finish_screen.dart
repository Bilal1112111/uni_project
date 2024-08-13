import 'package:flutter/material.dart';

import '../../generated/l10n.dart';
import '../../utils/theme.dart';

class AdvertisingFinishScreen extends StatelessWidget {
  const AdvertisingFinishScreen({super.key});
  static String route = "/advertisingfinish";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: MaterialTheme.lightScheme().background,
        body: Padding(
          padding: const EdgeInsets.only(top: 15, right: 10, left: 10),
          child: ListView(
            children: [
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.arrow_back_sharp,
                          color: MaterialTheme.lightScheme().primary,
                        )),
                  ),
                  const Expanded(flex: 6, child: SizedBox()),
                ],
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 140),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Center(
                        child: Icon(
                          Icons.done_all_rounded,
                          color: MaterialTheme.lightScheme().secondary,
                          size: 150,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(bottom: 10),
                        child: Text(
                          textAlign: TextAlign.center,
                          S.of(context).yourrequesthasbeensentsuccessfully,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 25,
                              color: MaterialTheme.lightScheme().onSecondary),
                        ),
                      ),
                      Text(
                        S.of(context).Thepaymentdetailswillbesenttoyousoonafter,
                        style: TextStyle(
                            fontSize: 15,
                            color: MaterialTheme.lightScheme().onSecondary),
                      ),
                      Text(
                        S.of(context).yourorderisreviewedbytheadministrators,
                        style: TextStyle(
                            fontSize: 15,
                            color: MaterialTheme.lightScheme().onSecondary),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 30),
                        child: Text(
                          S.of(context).thanksforchoosingus,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: MaterialTheme.lightScheme().onSecondary),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
