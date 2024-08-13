import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class AuthReusableButton extends StatelessWidget {
  const AuthReusableButton({
    super.key,
    this.onPressed,
    this.label = 'التالي',
    this.width = double.infinity,
  });
  final void Function()? onPressed;
  final String label;
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: 50.0,
      child: TextButton(
        style: ButtonStyle(
          shape: WidgetStatePropertyAll(
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10))),
          backgroundColor: WidgetStatePropertyAll(
            MaterialTheme.lightHighContrastScheme().secondary.withOpacity(0.95),
          ),
        ),
        //backgroundColor:
        onPressed: onPressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(label,
                style: Theme.of(context).textTheme.headlineSmall!.copyWith(
                      color: MaterialTheme.lightScheme().background,
                      fontWeight: FontWeight.w500,
                    )),
            const SizedBox(
              width: 5.0,
            ),
            Icon(
              Icons.navigate_next,
              color: MaterialTheme.lightScheme().background,
            ),
          ],
        ),
      ),
    );
  }
}
