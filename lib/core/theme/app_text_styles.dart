import 'package:flutter/material.dart';
import 'app_colors.dart';

class AppTextStyles {
  static const heading = TextStyle(
    fontSize: 24,
    fontWeight: FontWeight.bold,
    color: AppColors.textDark,
  );

  static const subHeading = TextStyle(
    fontSize: 14,
    color: AppColors.textLight,
  );

  static const label = TextStyle(
    fontSize: 12,
    fontWeight: FontWeight.w600,
    color: AppColors.textLight,
  );
}
