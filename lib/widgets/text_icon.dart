import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  final Text label;
  final Icon? leadingIcon;
  final Icon? trailingIcon;
  final double spacing = 8.0;
  const CustomTextIcon({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leadingIcon != null
            ? Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: leadingIcon!,
              )
            : const SizedBox(),
        label,
        trailingIcon != null ? Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
          child: trailingIcon!,
        ) : const SizedBox(),
      ],
    );
  }
}
