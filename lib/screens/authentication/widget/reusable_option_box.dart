import 'package:flutter/material.dart';

import '../../../utils/theme.dart';

class ReusableOptionBox extends StatelessWidget {
  const ReusableOptionBox({
    super.key,
    required this.onChanged,
    required this.value,
  });
  final void Function(bool?)? onChanged;
  final bool value;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 20,
      height: 20,
      child: Checkbox(
        checkColor: MaterialTheme.lightScheme().surfaceTint,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(3.0),
        ),
        fillColor: WidgetStatePropertyAll(
            MaterialTheme.lightScheme().tertiaryContainer),
        value: value,
        onChanged: onChanged,
        side: BorderSide.none,
      ),
    );
  }
}
