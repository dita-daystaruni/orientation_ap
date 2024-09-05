import 'package:flutter/material.dart';

class CustomTextIcon extends StatelessWidget {
  const CustomTextIcon({
    super.key,
    required this.label,
    this.leadingIcon,
    this.trailingIcon,
    this.isNumber = false,
    this.isCentered = false,
  });

  final Text label;
  final dynamic leadingIcon;
  final dynamic trailingIcon;
  // does not constraing phone numbers set to true not constraining
  final bool isNumber;
  // if centered increase constraint on text
  final bool isCentered;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        leadingIcon != null
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 0),
                child: leadingIcon!,
              )
            : const SizedBox(),
        isNumber
            ? label
            : SizedBox(
                width: MediaQuery.of(context).size.width *
                    (isCentered ? 0.7 : 0.5),
                child: label,
              ),
        trailingIcon != null
            ? Padding(
                padding: const EdgeInsets.only(right: 8.0),
                child: trailingIcon!,
              )
            : const SizedBox(),
      ],
    );
  }
}
