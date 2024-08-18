import 'package:flutter/material.dart';
import 'package:hello_world/utils/theme.dart';

class ExpandableText extends StatefulWidget {
  ExpandableText(this.text, {super.key});

  final String text;
  bool isExpanded = false;

  @override
  _ExpandableTextState createState() => _ExpandableTextState();
}

class _ExpandableTextState extends State<ExpandableText> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        ConstrainedBox(
          constraints: widget.isExpanded
              ? const BoxConstraints()
              : const BoxConstraints(maxHeight: 70.0),
          child: Text(
            widget.text,
            softWrap: true,
            overflow: TextOverflow.fade,
          ),
        ),
        widget.isExpanded
            ? TextButton(
                onPressed: () => setState(() => widget.isExpanded = false),
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                    MaterialTheme.lightScheme().primary.withAlpha(100),
                  ),
                ),
                child: Text(
                  'Show less',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MaterialTheme.lightScheme().primary,
                      ),
                ),
              )
            : TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStatePropertyAll(
                    MaterialTheme.lightScheme().primary.withAlpha(100),
                  ),
                ),
                onPressed: () => setState(() => widget.isExpanded = true),
                child: Text(
                  'Show More',
                  style: Theme.of(context).textTheme.titleMedium!.copyWith(
                        color: MaterialTheme.lightScheme().primary,
                      ),
                ),
              ),
      ],
    );
  }
}
