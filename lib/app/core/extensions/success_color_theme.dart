import 'package:flutter/material.dart';

class SuccessColorTheme extends ThemeExtension<SuccessColorTheme> {
  final Color? successColor;
  final Color? onSuccessColor;

  const SuccessColorTheme({
    this.successColor,
    this.onSuccessColor,
  });

  @override
  SuccessColorTheme copyWith({Color? successColor, Color? onSuccessColor}) {
    return SuccessColorTheme(
      successColor: successColor ?? this.successColor,
      onSuccessColor: onSuccessColor ?? this.onSuccessColor,
    );
  }

  @override
  SuccessColorTheme lerp(ThemeExtension<SuccessColorTheme>? other, double t) {
    if (other is! SuccessColorTheme) return this;
    return SuccessColorTheme(
      successColor: Color.lerp(successColor, other.successColor, t),
      onSuccessColor: Color.lerp(onSuccessColor, other.onSuccessColor, t),
    );
  }
}
