import 'package:flutter/material.dart';

class BillingBreakdown extends StatelessWidget {
  const BillingBreakdown({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: BorderRadius.circular(12),
      color: Colors.white,
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          children: const [
            _Row(
              "Total Due",
              "₹ 8,433",
              bold: true,
              big: true, // ⭐ more prominent
            ),
            Divider(height: 20),

            _Row("Base fare per adult", "₹662"),
            _Row("Tax", "₹53"),
            _Row("Reservation charge", "₹40"),
            _Row("Superfast charge", "₹45"),
            _Row("Tatkal fare", "₹300"),

            Divider(height: 20),

            _Row(
              "Total Price per adult",
              "₹1100",
              bold: true,
              big: true, // ⭐ same prominence
            ),
          ],
        ),
      ),
    );
  }
}

class _Row extends StatelessWidget {
  final String l;
  final String v;
  final bool bold;
  final bool big;

  const _Row(
      this.l,
      this.v, {
        this.bold = false,
        this.big = false,
      });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            l,
            style: TextStyle(
              fontSize: big ? 15 : 13,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
          Text(
            v,
            style: TextStyle(
              fontSize: big ? 15 : 13,
              fontWeight: bold ? FontWeight.w700 : FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
