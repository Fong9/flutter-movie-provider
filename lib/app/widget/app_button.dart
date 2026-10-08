import 'package:flutter/material.dart';
import 'package:m_booking/app/constants/color_app.dart';

class AppButton extends StatelessWidget {
  final Widget child;
  final Color? color;
  final Color? borderColor;
  final VoidCallback? onTap;
  const AppButton({super.key, this.color, required this.child, this.borderColor, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 50,
        decoration: BoxDecoration(
          color: color,
          border: Border.all(color: borderColor ?? AppColor.primary),
          borderRadius: .circular(30),
        ),
        child: child,
      ),
    );
  }
}