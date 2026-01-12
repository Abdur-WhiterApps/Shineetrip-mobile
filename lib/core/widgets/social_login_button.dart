import 'package:flutter/material.dart';

class SocialLoginButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback onTap;

  const SocialLoginButton({
    super.key,
    required this.icon,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
        radius: 22,
        backgroundColor: Colors.white,
        child: Icon(icon, color: Colors.black),
      ),
    );
  }
}
