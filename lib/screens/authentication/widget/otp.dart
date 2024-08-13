import 'package:flutter/cupertino.dart';

import 'otp_field.dart';

class OTP extends StatelessWidget {
  OTP({
    required this.num1,
    required this.num2,
    required this.num3,
    required this.num4,
  });
  final TextEditingController num1;
  final TextEditingController num2;
  final TextEditingController num3;
  final TextEditingController num4;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Form(
        child: Row(
          children: [
            Expanded(
              child: OtpField(
                controller: num1,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: OtpField(
                controller: num2,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: OtpField(
                controller: num3,
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Expanded(
              child: OtpField(
                controller: num4,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
