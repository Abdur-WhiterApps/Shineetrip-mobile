import 'package:flutter/material.dart';
import 'stat_item.dart';

class StatsRow extends StatelessWidget {
  const StatsRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          StatItem("50+", "Destinations"),
          StatItem("10k+", "Customers"),
          StatItem("15+", "Years"),
          StatItem("100%", "Satisfaction"),
        ],
      ),
    );
  }
}
