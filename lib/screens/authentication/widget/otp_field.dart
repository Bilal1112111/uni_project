import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../../utils/theme.dart';

class OtpField extends StatelessWidget {
  const OtpField({
    super.key,
    required this.controller,
  });
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: TextFormField(
        key: key,
        controller: controller,
        onChanged: (value) {
          if (value.length == 1) {
            FocusScope.of(context).nextFocus();
            print(value);
          }
        },
        onSaved: (value) {},
        keyboardType: TextInputType.number,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly
        ],
        textAlign: TextAlign.center,
        cursorColor: MaterialTheme.lightScheme().surfaceTint,
        decoration: InputDecoration(
          filled: true,
          fillColor: MaterialTheme.lightScheme().primary.withOpacity(0.5),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: MaterialTheme.lightScheme().primary,
              width: 1,
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
      ),
    );
  }
}
