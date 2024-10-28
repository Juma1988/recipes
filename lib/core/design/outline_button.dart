import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  final VoidCallback? onPressed;
  final String label;
  final bool isOutlined;
  final double borderRadius;
  final double outlineWidth;
  final Color outlineColor;
  final Color? fontColor;
  final Color? fillColor;
  final double fontSize;
  final FontWeight fontWeight;

  const AppButton({
    super.key,
    required this.label,
    this.onPressed,
    this.isOutlined = false,
    this.borderRadius = 8.0,
    this.outlineWidth = 1.0,
    this.outlineColor = Colors.black,
    this.fontColor,
    this.fontSize = 16,
    this.fontWeight = FontWeight.w600,
    this.fillColor,
  });

  @override
  Widget build(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;

    final Color defaultFillColor = isOutlined ? Colors.transparent : colorScheme.primary;
    final Color effectiveFillColor = fillColor ?? defaultFillColor;

    final Color defaultFontColor = isOutlined ? colorScheme.primary : colorScheme.onPrimary;
    final Color effectiveFontColor = fontColor ?? defaultFontColor;

    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        minimumSize: Size(double.infinity, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(borderRadius),
        ),
        side: isOutlined
            ? BorderSide(
          color: outlineColor,
          width: outlineWidth,
        )
            : null,
        backgroundColor: effectiveFillColor,
        foregroundColor: effectiveFontColor,
        padding: EdgeInsets.symmetric(vertical: 16),
      ),
      onPressed: onPressed,
      child: Text(
        label,
        style: TextStyle(
          color: effectiveFontColor,
          fontSize: fontSize,
          fontWeight: fontWeight,
        ),
      ),
    );
  }
}