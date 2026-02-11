import 'package:blabla/ui/theme/theme.dart';
import 'package:flutter/material.dart';

enum BlaButtonType { primary, secondary }

class BlaButton extends StatelessWidget {
  final String label;
  final VoidCallback? onPressed;
  final IconData? icon;
  final BlaButtonType type;

  const BlaButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.icon,
    this.type = BlaButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    final bool isPrimary = type == BlaButtonType.primary;
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: EdgeInsets.symmetric(
            horizontal: BlaSpacings.m,
            vertical: BlaSpacings.s,
          ),
          decoration: BoxDecoration(
            color: isPrimary ? BlaColors.primary : BlaColors.white,
            borderRadius: BorderRadius.circular(BlaSpacings.radius),
            border: isPrimary
                ? null
                : Border.all(color: BlaColors.neutralDark, width: 1.0),
          ),
          child: _buttonContent(isPrimary),
        ),
      ),
    );
  }

  Widget _buttonContent(bool isPrimary) {
    final text = Text(
      label,
      style: BlaTextStyles.button.copyWith(
        color: isPrimary ? BlaColors.white : BlaColors.primary,
      ),
    );

    if (icon == null) return text;

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          icon,
          size: 16,
          color: isPrimary ? BlaColors.white : BlaColors.primary,
        ),
        const SizedBox(width: 8),
        text,
      ],
    );
  }
}
