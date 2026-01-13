import 'package:flutter/material.dart';

class EnquiryContainer extends StatelessWidget {
  final Widget child;

  const EnquiryContainer({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: const Color(0xFFC9A24D),
              width: 1,
            ),
            borderRadius: BorderRadius.circular(12),
          ),
          child: child,
        ),

        Positioned(
          top: 0,
          right: 0,
          child: Container(
            height: 22,
            width: 22,
            decoration: const BoxDecoration(
              border: Border(
                top: BorderSide(
                    color: Color(0xFFC9A24D), width: 2),
                right: BorderSide(
                    color: Color(0xFFC9A24D), width: 2),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
